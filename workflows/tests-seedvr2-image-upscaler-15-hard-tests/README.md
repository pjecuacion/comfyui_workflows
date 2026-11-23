# SeedVR2 AI Image Upscaler: 15 Hard Tests (4x)

Workflows from the Prince Does AI video "SeedVR2 AI Image Upscaler: 15 Hard Tests (4x)" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_seedvr2_upscale.json` | seedvr2-upscale | seed 20261124, aspect 16:9, scale 4 |

## Models you need

- `seedvr2_ema_vae_fp16.safetensors`
- `seedvr2_7b_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`ImageCompare`, `JoinImageWithAlpha`, `KSampler`, `LoadImage`, `ResizeImageMaskNode`, `SaveImage`, `SeedVR2Conditioning`, `SeedVR2PostProcessing`, `SeedVR2Preprocess`, `UNETLoader`, `VAEDecodeTiled`, `VAEEncodeTiled`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/ByteDance-Seed/SeedVR2-7B)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
