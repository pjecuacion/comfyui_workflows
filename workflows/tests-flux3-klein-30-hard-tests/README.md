# I Tested FLUX 3 Klein: 30 Hard Tests

Workflows from the Prince Does AI video "I Tested FLUX 3 Klein: 30 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_flux3_klein.json` | klein | seed 2026, aspect 16:9 |
| `image_flux3_klein_edit.json` | klein-edit | the saved defaults |

## Models you need

- `qwen3.5_9b_flux3_prompt_upsampler_int8_convrot.safetensors`
- `flux3_image_klein_int8_convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `KSampler`, `LoadImage`, `PreviewAny`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `ResolutionSelector`, `SaveImage`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
