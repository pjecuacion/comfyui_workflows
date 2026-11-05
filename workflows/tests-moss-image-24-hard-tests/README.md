# I Tested MOSS-Image: 24 Hard Tests

Workflows from the Prince Does AI video "I Tested MOSS-Image: 24 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_moss.json` | moss | seed 20261106, aspect 16:9, enhance False |

## Models you need

- `moss_image_sft_int8_convrot.safetensors`
- `qwen3.5_9b_w4a8_gptq.safetensors`
- `flux2-vae_small.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `EmptyFlux2LatentImage`, `KSampler`, `PreviewAny`, `PrimitiveStringMultiline`, `ResolutionSelector`, `SaveImage`, `SkipLayerGuidanceDiTSimple`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
