# pi-H3 reference to video: 12 swap tests

Workflows from the Prince Does AI video "pi-H3 reference to video: 12 swap tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_z_image_turbo.json` | Z-Image Turbo | prompt ..., width 1024, height 1024, seed 42 |
| `image_qwen_edit_2511.json` | qwen-edit-2511 | image refs/base.png, prompt ..., seed 42 |
| `video_pi_h3_ref.json` | pi-h3-ref | seed 42, aspect 16:9, voice D:\prince_does_ai\videos\2026-11-26-pi-h3-reference-swap-12-tests\versus\refs\voice.wav, steps 4, seconds 6, megapixels 0.97 |

## Models you need

- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `qwen_image_vae.safetensors`
- `Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors`
- `qwen_image_edit_2511_int8_convrot.safetensors`
- `qwen_2.5_vl_7b_fp8_scaled.safetensors`
- `minimax_h3_ref2va_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `pi_h3_2step_dwd_adapter_int8_convrot.safetensors`
- `pi_h3_4step_dwd_adapter_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BlockSparseAttention`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateVideo`, `DWD Decode`, `EmptySD3LatentImage`, `FluxKontextImageScale`, `FluxKontextMultiReferenceLatentMethod`, `KSampler`, `KSamplerSelect`, `Load LakonLab Adapter`, `LoadAudio`, `LoadImage`, `LoraLoaderModelOnly`, `MiniMaxH3ReferenceToVideo`, `MiniMaxH3SigmaShift`, `ModelSamplingAuraFlow`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveImage`, `SaveImageAdvanced`, `SaveVideo`, `TextEncodeQwenImageEditPlus`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAEEncode`, `VAELoader`, `pi-Flow Scheduler`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (Z-Image Turbo): apache-2.0
- Model licence (qwen-edit-2511): apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
