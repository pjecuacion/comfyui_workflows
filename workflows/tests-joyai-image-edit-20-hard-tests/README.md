# I Tested JoyAI Image Edit: 20 Hard Edits on Real Photos

Workflows from the Prince Does AI video "I Tested JoyAI Image Edit: 20 Hard Edits on Real Photos" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_joyai_edit.json` | joyai-edit | seed 20261108 |

## Models you need

- `joyai_image_edit_int8_convrot.safetensors`
- `qwen3vl_8b_joyimage_edit_int8_convrot.safetensors`
- `wan_2.1_vae.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGNorm`, `CLIPLoader`, `EmptySD3LatentImage`, `GetImageSize`, `ImageCompare`, `ImageScaleToTotalPixels`, `KSampler`, `LoadImage`, `SaveImageAdvanced`, `TextEncodeJoyImageEdit`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/jdopensource/JoyAI-Image-Edit)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
