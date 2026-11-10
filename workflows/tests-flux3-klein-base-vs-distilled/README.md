# FLUX 3 Klein: ComfyUI's Default vs the Recommended Setup

Workflows from the Prince Does AI video "FLUX 3 Klein: ComfyUI's Default vs the Recommended Setup" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_flux3_klein.json` | FLUX 3 Image Klein | seed 2026, aspect 16:9 |
| `image_flux3_klein_distilled.json` | FLUX 3 Image Klein | seed 2026, aspect 16:9 |
| `image_flux3_klein_edit.json` | FLUX 3 Image Klein | the saved defaults |
| `image_flux3_klein_distilled_edit.json` | FLUX 3 Image Klein | the saved defaults |

## Models you need

- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-base-int8-convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `flux3-image-klein-int8-convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BatchImagesNode`, `CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `Flux3LayoutPrompt`, `ImageCompare`, `KSampler`, `LoadImage`, `PreviewAny`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `ResolutionSelector`, `SaveImage`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
