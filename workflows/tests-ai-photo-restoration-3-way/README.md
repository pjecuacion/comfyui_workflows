# AI Photo Restoration: Qwen Image Edit 2511 vs JoyAI vs Microsoft Mage-Flow

Workflows from the Prince Does AI video "AI Photo Restoration: Qwen Image Edit 2511 vs JoyAI vs Microsoft Mage-Flow" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_edit_2511.json` | qwen-edit-2511 | seed 20261109 |
| `image_joyai_edit.json` | joyai-edit | seed 20261109 |
| `image_mage_flow_edit.json` | mage-flow-edit | seed 20261109 |

## Models you need

- `qwen_image_vae.safetensors`
- `Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors`
- `qwen_image_edit_2511_int8_convrot.safetensors`
- `qwen_2.5_vl_7b_fp8_scaled.safetensors`
- `joyai_image_edit_int8_convrot.safetensors`
- `qwen3vl_8b_joyimage_edit_int8_convrot.safetensors`
- `wan_2.1_vae.safetensors`
- `mage_flow_edit_int8_convrot.safetensors`
- `qwen3vl_4b_bf16.safetensors`
- `mage_flow_vae_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGNorm`, `CLIPLoader`, `ComfySwitchNode`, `EmptySD3LatentImage`, `FluxKontextImageScale`, `FluxKontextMultiReferenceLatentMethod`, `GetImageSize`, `ImageCompare`, `ImageScaleToTotalPixels`, `KSampler`, `LoadImage`, `LoraLoaderModelOnly`, `ModelSamplingAuraFlow`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `SaveImageAdvanced`, `TextEncodeJoyImageEdit`, `TextEncodeMageFlowEdit`, `TextEncodeQwenImageEditPlus`, `UNETLoader`, `VAEDecode`, `VAEEncode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (qwen-edit-2511): apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)
- Model licence (joyai-edit): apache-2.0 (https://huggingface.co/jdopensource/JoyAI-Image-Edit)
- Model licence (mage-flow-edit): mit (https://github.com/microsoft/Mage/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
