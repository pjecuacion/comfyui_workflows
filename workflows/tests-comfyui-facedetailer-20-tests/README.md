# ComfyUI FaceDetailer: Does It Really Fix AI Faces? 20 Hard Tests

Workflows from the Prince Does AI video "ComfyUI FaceDetailer: Does It Really Fix AI Faces? 20 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261121, aspect 16:9, width 1664, height 928 |

## Models you need

- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ConditioningZeroOut`, `EmptySD3LatentImage`, `KSampler`, `ModelSamplingAuraFlow`, `SaveImage`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
