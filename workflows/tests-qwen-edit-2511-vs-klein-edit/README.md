# Qwen Image Edit 2511 vs FLUX 3 Klein Edit: Same Character, 20 Hard Tests

Workflows from the Prince Does AI video "Qwen Image Edit 2511 vs FLUX 3 Klein Edit: Same Character, 20 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_edit_2511.json` | qwen-edit-2511 | seed 20261013 |
| `image_flux3_klein_edit.json` | FLUX 3 Image Klein | seed 20261013, enhance False |

## Models you need

- `qwen_image_vae.safetensors`
- `Qwen-Image-Edit-2511-Lightning-4steps-V1.0-bf16.safetensors`
- `qwen_image_edit_2511_int8_convrot.safetensors`
- `qwen_2.5_vl_7b_fp8_scaled.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-base-int8-convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `Flux3LayoutPrompt`, `FluxKontextImageScale`, `FluxKontextMultiReferenceLatentMethod`, `ImageCompare`, `KSampler`, `LoadImage`, `LoraLoaderModelOnly`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `SaveImage`, `SaveImageAdvanced`, `TextEncodeQwenImageEditPlus`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAEEncode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
