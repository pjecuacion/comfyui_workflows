# FLUX 3 Klein vs Qwen Image 2.1: Same Hard Tests

Workflows from the Prince Does AI video "FLUX 3 Klein vs Qwen Image 2.1: Same Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_flux3_klein_distilled.json` | FLUX 3 Image Klein | seed 2026, aspect 16:9, enhance False |
| `image_qwen_2_1.json` | Qwen Image 2.1 | seed 2026, aspect 16:9, enhance False |
| `image_flux3_klein_distilled_edit.json` | FLUX 3 Image Klein | the saved defaults |
| `image_qwen_2_1_edit.json` | Qwen Image 2.1 Edit | the saved defaults |

## Models you need

- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-int8-convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_t2i.int8_convrot.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_i2i.int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `Flux3LayoutPrompt`, `ImageCompare`, `KSampler`, `LoadImage`, `PreviewAny`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `ReferenceMultiLatent`, `ResolutionSelector`, `SaveImage`, `SaveImageAdvanced`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
