# MiniMax H3 Ref2VA: normal run vs VDN

Workflows from the Prince Does AI video "MiniMax H3 Ref2VA: normal run vs VDN" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_h3_ref2va_ckpt.json` | MiniMax H3 | seed 42, aspect 16:9, unet minimax_h3_ref2va_pruned_int8_convrot.safetensors, turbo True, turbo_lora minimax_h3_ref2v_turbo_8step_v1.0_768p_comfyui_bf16.safetensors, turbo_strength 1.0, steps 8, megapixels 0.4 |
| `video_h3_ref2va_vdn.json` | MiniMax H3 | seed 42, aspect 16:9, megapixels 0.4 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_ref2va_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_ref2v_turbo_8step_v1.0_768p_comfyui_bf16.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`ApplyVDNH3Advanced`, `BasicGuider`, `BasicScheduler`, `CLIPLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `KSamplerSelect`, `LoadAudio`, `LoadImage`, `LoadRifeTensorrtModel`, `LoraLoaderModelOnly`, `MiniMaxH3ReferenceToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `Power Lora Loader (rgthree)`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RTXVideoSuperResolution`, `RandomNoise`, `ResolutionSelector`, `RifeTensorrt`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`, `VRAMCleanup`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (MiniMax H3): minimax-h3-community-license-agreement (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
