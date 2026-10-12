# Z-Image Turbo vs Qwen Image 2.1

Workflows from the Prince Does AI video "Z-Image Turbo vs Qwen Image 2.1" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261012, aspect 16:9, width 1376, height 768 |
| `image_qwen_2_1.json` | Qwen Image 2.1 | seed 20261012, aspect 16:9, enhance False |

## Models you need

- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_t2i.int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyLatentImage`, `EmptySD3LatentImage`, `KSampler`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `ResolutionSelector`, `SaveImage`, `SaveImageAdvanced`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
