# ComfyUI GGUF: Do Smaller Model Files Make Worse Pictures?

Workflows from the Prince Does AI video "ComfyUI GGUF: Do Smaller Model Files Make Worse Pictures?" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261122, aspect 16:9, width 1376, height 768 |
| `image_zimage_gguf.json` | zimage-gguf | seed 20261122, aspect 16:9, width 1376, height 768, unet z-image-turbo-Q2_K.gguf |

## Models you need

- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `z-image-turbo-Q8_0.gguf`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ConditioningZeroOut`, `EmptySD3LatentImage`, `KSampler`, `ModelSamplingAuraFlow`, `SaveImage`, `UNETLoader`, `UnetLoaderGGUF`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (Z-Image Turbo): apache-2.0
- Model licence (zimage-gguf): apache-2.0 (https://huggingface.co/unsloth/Z-Image-Turbo-GGUF)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
