# MOSS-Image Base vs SFT: Is the Fine-Tune Really Better?

Workflows from the Prince Does AI video "MOSS-Image Base vs SFT: Is the Fine-Tune Really Better?" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_moss_base.json` | moss-base | seed 20261124, aspect 16:9, enhance True |
| `image_moss.json` | moss | seed 20261124, aspect 16:9, enhance True |

## Models you need

- `moss_image_base_int8_convrot.safetensors`
- `qwen3.5_9b_w4a8_gptq.safetensors`
- `flux2-vae_small.safetensors`
- `moss_image_sft_int8_convrot.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `EmptyFlux2LatentImage`, `KSampler`, `PreviewAny`, `PrimitiveStringMultiline`, `ResolutionSelector`, `SaveImage`, `SkipLayerGuidanceDiTSimple`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
