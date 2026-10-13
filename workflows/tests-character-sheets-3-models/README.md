# AI character sheets: Qwen Image 2.1 vs Krea 2 Turbo vs Z-Image Turbo

Workflows from the Prince Does AI video "AI character sheets: Qwen Image 2.1 vs Krea 2 Turbo vs Z-Image Turbo" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_2_1.json` | Qwen Image 2.1 | seed 20261013, aspect 4:3, enhance False |
| `image_krea2_turbo.json` | Krea 2 Turbo | seed 20261013, aspect 4:3, enhance False, sketch False |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261013, aspect 4:3, width 1184, height 896 |

## Models you need

- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_t2i.int8_convrot.safetensors`
- `krea2_turbo_int8_convrot.safetensors`
- `qwen3vl_4b_fp8_scaled.safetensors`
- `qwen_image_vae.safetensors`
- `krea2_darkbrush.safetensors`
- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyLatentImage`, `EmptySD3LatentImage`, `KSampler`, `LoraLoaderModelOnly`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `ResolutionSelector`, `SaveImage`, `SaveImageAdvanced`, `StringConcatenate`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
