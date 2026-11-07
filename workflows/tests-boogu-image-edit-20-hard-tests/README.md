# I Tested Boogu Image Edit: 20 Hard Edits on Real Photos

Workflows from the Prince Does AI video "I Tested Boogu Image Edit: 20 Hard Edits on Real Photos" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_boogu_edit.json` | boogu-edit | seed 20261108 |

## Models you need

- `boogu_image_edit_int8_convrot.safetensors`
- `ae.safetensors`
- `qwen3vl_8b_fp8_scaled.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicScheduler`, `CLIPLoader`, `EmptyLatentImage`, `GetImageSize`, `ImageCompare`, `KSamplerSelect`, `LoadImage`, `ModelSamplingAuraFlow`, `ResizeImageMaskNode`, `SamplerCustom`, `SaveImageAdvanced`, `TextEncodeBooguEdit`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/Boogu/Boogu-Image-0.1-Edit)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
