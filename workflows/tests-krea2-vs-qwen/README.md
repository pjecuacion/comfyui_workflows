# Krea 2 vs Qwen Image 2.1

Workflows from the Prince Does AI video "Krea 2 vs Qwen Image 2.1" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_krea2_turbo.json` | Krea 2 Turbo | seed 20261010, aspect 16:9, enhance False |
| `image_qwen_2_1.json` | Qwen Image 2.1 | seed 20261010, aspect 16:9, enhance False |
| `image_qwen_2_1_edit.json` | Qwen Image 2.1 Edit | the saved defaults |

## Models you need

- `krea2_turbo_int8_convrot.safetensors`
- `qwen3vl_4b_fp8_scaled.safetensors`
- `qwen_image_vae.safetensors`
- `krea2_darkbrush.safetensors`
- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_t2i.int8_convrot.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_i2i.int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyLatentImage`, `ImageCompare`, `KSampler`, `LoadImage`, `LoraLoaderModelOnly`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `ResolutionSelector`, `SaveImage`, `SaveImageAdvanced`, `StringConcatenate`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
