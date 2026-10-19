# FLUX 3 Klein: with vs without my own oil-painting LoRA

Workflows from the Prince Does AI video "FLUX 3 Klein: with vs without my own oil-painting LoRA" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_flux3_klein_lora.json` | FLUX 3 Image Klein | seed 20261019, aspect 16:9, strength 1.0 |
| `image_flux3_klein_edit_lora.json` | FLUX 3 Image Klein (edit) | seed 20261019, LoRA strength 1.5 |

## Models you need

- `qwen3.5_9b_flux3_prompt_upsampler_int8_convrot.safetensors`
- `flux3_image_klein_int8_convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `mnt_oil_klein3.safetensors` (my oil-painting style LoRA, trigger word `mnt_oil`, put it in `models/loras/`): https://huggingface.co/pjecuacion/flux3-klein-mnt-oil-monet-lora

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `KSampler`, `LoadImage`, `LoraLoaderModelOnly`, `PreviewAny`, `PrimitiveStringMultiline`, `ReferenceMultiLatent`, `ResolutionSelector`, `SaveImage`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
