# I Tested Microsoft Mage-Flow Edit: 20 Hard Edits on Real Photos

Workflows from the Prince Does AI video "I Tested Microsoft Mage-Flow Edit: 20 Hard Edits on Real Photos" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_mage_flow_edit.json` | mage-flow-edit | seed 20261108 |

## Models you need

- `mage_flow_edit_int8_convrot.safetensors`
- `qwen3vl_4b_bf16.safetensors`
- `mage_flow_vae_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `ComfySwitchNode`, `GetImageSize`, `ImageScaleToTotalPixels`, `KSampler`, `LoadImage`, `PrimitiveBoolean`, `PrimitiveInt`, `SaveImageAdvanced`, `TextEncodeMageFlowEdit`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: mit (https://github.com/microsoft/Mage/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
