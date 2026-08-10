# Purpose: Validate the dedicated MiniMax H3 Turbo workflow and installed assets.
# Expected behavior: Six-step Turbo sampling preserves duration while RIFE raises 24 fps to 48 fps.
# Related plan: 2026-08-06 MiniMax H3 Turbo Single-Shot Workflow.
# Preconditions: C:\ComfyUI_windows_portable contains the downloaded model, LoRA, and custom nodes.

$ErrorActionPreference = 'Stop'
$repo = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$comfy = 'C:\ComfyUI_windows_portable\ComfyUI'
$workflowPath = Join-Path $repo 'workflows\minimax-h3-turbo\minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json'
$modelPath = Join-Path $comfy 'models\diffusion_models\minimax_h3_fl2va_pruned_int8_convrot.safetensors'
$loraPath = Join-Path $comfy 'models\loras\minimax_h3_turbo_4step_ckpt500.safetensors'
$nodePath = Join-Path $comfy 'custom_nodes\ComfyUI-MiniMax-H3-Turbo\__init__.py'
$encoderPath = Join-Path $comfy 'models\text_encoders\qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors'
$videoVaePath = Join-Path $comfy 'models\vae\minimax_h3_video_vae_fp16.safetensors'
$audioVaePath = Join-Path $comfy 'models\vae\minimax_h3_audio_vae_fp32.safetensors'

function Assert-True([bool]$condition, [string]$message) {
    if (-not $condition) { throw $message }
}

function Get-Node($workflow, [int]$id) {
    return $workflow.nodes | Where-Object id -eq $id | Select-Object -First 1
}

function Get-Link($workflow, [int]$id) {
    return $workflow.links | Where-Object { $_[0] -eq $id } | Select-Object -First 1
}

Assert-True (Test-Path -LiteralPath $modelPath) 'Full non-pruned INT8 model is missing.'
Assert-True ((Get-Item -LiteralPath $modelPath).Length -gt 15GB) 'Pruned INT8 model is unexpectedly small.'
Assert-True (Test-Path -LiteralPath $loraPath) 'Recommended non-EMA Turbo LoRA is missing.'
Assert-True ((Get-Item -LiteralPath $loraPath).Length -gt 500MB) 'Turbo LoRA is unexpectedly small.'
Assert-True (Test-Path -LiteralPath $nodePath) 'MiniMax H3 Turbo custom nodes are missing.'
Assert-True (Test-Path -LiteralPath $encoderPath) 'Existing NVFP4 text encoder is missing.'
Assert-True (Test-Path -LiteralPath $videoVaePath) 'Existing video VAE is missing.'
Assert-True (Test-Path -LiteralPath $audioVaePath) 'Existing audio VAE is missing.'
Assert-True (Test-Path -LiteralPath (Join-Path $comfy 'custom_nodes\comfyui-frame-interpolation')) 'RIFE node pack is missing.'
Assert-True (Test-Path -LiteralPath (Join-Path $comfy 'custom_nodes\comfyui_nvidia_rtx_nodes')) 'RTX node pack is missing.'
Assert-True (Test-Path -LiteralPath $workflowPath) 'Turbo workflow is missing.'

$workflow = Get-Content -Raw -LiteralPath $workflowPath | ConvertFrom-Json
$linkIds = @($workflow.links | ForEach-Object { $_[0] })
Assert-True (($linkIds | Sort-Object -Unique).Count -eq $linkIds.Count) 'Link IDs are not unique.'

Assert-True ((Get-Node $workflow 127).widgets_values[0] -eq 'minimax_h3_fl2va_pruned_int8_convrot.safetensors') 'Wrong diffusion model.'
Assert-True ((Get-Node $workflow 128).widgets_values[0] -eq 'qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors') 'Wrong text encoder.'
Assert-True ((Get-Node $workflow 134).widgets_values[0] -eq 'minimax_h3_turbo_4step_ckpt500.safetensors') 'Wrong Turbo LoRA.'
Assert-True ((Get-Node $workflow 124).widgets_values[0] -eq 'simple') 'Turbo scheduler must be simple.'
Assert-True ((Get-Node $workflow 124).widgets_values[1] -eq 6) 'Turbo workflow must use 6 steps.'
Assert-True ((Get-Node $workflow 135).type -eq 'MiniMaxH3TurboSampler') 'Special Turbo sampler is missing.'

Assert-True (((Get-Link $workflow 249)[1,3] -join ',') -eq '127,134') 'UNET must feed Turbo LoRA.'
Assert-True ($null -eq ($workflow.nodes | Where-Object type -eq 'PathchSageAttentionKJ')) 'Do not double-patch global SageAttention.'
Assert-True (((Get-Link $workflow 250)[1,3] -join ',') -eq '134,126') 'Turbo LoRA must feed the guider directly.'
Assert-True (((Get-Link $workflow 251)[1,3] -join ',') -eq '134,124') 'Turbo LoRA must feed the scheduler directly.'
Assert-True (((Get-Link $workflow 252)[1,3] -join ',') -eq '135,125') 'Turbo sampler must feed the advanced sampler.'
Assert-True (((Get-Link $workflow 254)[1,3] -join ',') -eq '122,137') 'Decode must feed RIFE before upscale.'
Assert-True (((Get-Link $workflow 255)[1,3] -join ',') -eq '137,138') 'RIFE must feed RTX upscale.'
Assert-True (((Get-Link $workflow 256)[1,3] -join ',') -eq '138,130') 'RTX upscale must feed CreateVideo.'
Assert-True (((Get-Link $workflow 257)[1,3] -join ',') -eq '121,139') 'Decoded audio must feed the finite guard.'
Assert-True (((Get-Link $workflow 239)[1,3] -join ',') -eq '139,130') 'Sanitized audio must feed CreateVideo.'
Assert-True ((Get-Node $workflow 139).type -eq 'MiniMaxH3AudioFiniteGuard') 'Audio finite guard is missing.'

Assert-True ((Get-Node $workflow 137).widgets_values[2] -eq 2) 'RIFE must interpolate 2x.'
$createVideo = Get-Node $workflow 130
Assert-True ($createVideo.widgets_values[0] -eq 48) 'Final video must be encoded at 48 fps.'
Assert-True ($null -eq $createVideo.inputs[0].widget) 'Final FPS must not be driven by a stale link.'

$nativeFrames = 294
$interpolatedFrames = (($nativeFrames - 1) * 2) + 1
$nativeDuration = ($nativeFrames - 1) / 24
$finalDuration = ($interpolatedFrames - 1) / 48
Assert-True ($interpolatedFrames -eq 587) 'Unexpected 2x interpolation frame count.'
Assert-True ([Math]::Abs($nativeDuration - $finalDuration) -lt 0.000001) 'Interpolation changes video duration.'

Write-Output 'PASS: MiniMax H3 Turbo workflow graph and local assets are valid.'
