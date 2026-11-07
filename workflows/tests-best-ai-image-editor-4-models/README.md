# Best AI Image Editor in ComfyUI: Qwen Edit 2511 vs JoyAI vs Boogu vs FLUX 3 Klein

Workflows from the Prince Does AI video "Best AI Image Editor in ComfyUI: Qwen Edit 2511 vs JoyAI vs Boogu vs FLUX 3 Klein" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_edit_2511.json` | qwen-edit-2511 | seed 20261108 |
| `image_joyai_edit.json` | joyai-edit | seed 20261108 |
| `image_boogu_edit.json` | boogu-edit | seed 20261108 |
| `image_flux3_klein_edit.json` | FLUX 3 Image Klein | seed 20261108, enhance False |

## Models you need

- `qwen_image_vae.safetensors`
- `Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors`
- `qwen_image_edit_2511_int8_convrot.safetensors`
- `qwen_2.5_vl_7b_fp8_scaled.safetensors`
- `joyai_image_edit_int8_convrot.safetensors`
- `qwen3vl_8b_joyimage_edit_int8_convrot.safetensors`
- `wan_2.1_vae.safetensors`
- `boogu_image_edit_int8_convrot.safetensors`
- `ae.safetensors`
- `qwen3vl_8b_fp8_scaled.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-base-int8-convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicScheduler`, `BatchImagesNode`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `EmptySD3LatentImage`, `Flux3LayoutPrompt`, `FluxKontextImageScale`, `FluxKontextMultiReferenceLatentMethod`, `GetImageSize`, `ImageCompare`, `ImageScaleToTotalPixels`, `KSampler`, `KSamplerSelect`, `LoadImage`, `LoraLoaderModelOnly`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `ResizeImageMaskNode`, `SamplerCustom`, `SaveImage`, `SaveImageAdvanced`, `TextEncodeBooguEdit`, `TextEncodeJoyImageEdit`, `TextEncodeQwenImageEditPlus`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAEEncode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (qwen-edit-2511): apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)
- Model licence (joyai-edit): apache-2.0 (https://huggingface.co/jdopensource/JoyAI-Image-Edit)
- Model licence (boogu-edit): apache-2.0 (https://huggingface.co/Boogu/Boogu-Image-0.1-Edit)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
