# I Tested Qwen Image 2.1 Edit: 20 Hard Tests With Real Photos

Workflows from the Prince Does AI video "I Tested Qwen Image 2.1 Edit: 20 Hard Tests With Real Photos" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_2_1_edit.json` | Qwen Image 2.1 Edit | seed 20261013, enhance False |

## Models you need

- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_i2i.int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CLIPLoader`, `ComfySwitchNode`, `EmptyLatentImage`, `ImageCompare`, `KSampler`, `LoadImage`, `PreviewAny`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `SaveImageAdvanced`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
