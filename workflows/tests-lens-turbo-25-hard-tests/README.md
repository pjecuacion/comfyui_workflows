# Microsoft Lens Turbo: 25 Hard Tests

Workflows from the Prince Does AI video "Microsoft Lens Turbo: 25 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_lens.json` | lens | seed 20261109, aspect 16:9, megapixels 2 |

## Models you need

- `flux2-vae.safetensors`
- `gpt_oss_20b_nvfp4.safetensors`
- `lens_turbo_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicScheduler`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `EmptyLatentImage`, `KSamplerSelect`, `ModelSamplingFlux`, `PrimitiveInt`, `ResolutionSelector`, `SamplerCustom`, `SaveImage`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: mit (https://huggingface.co/Comfy-Org/Lens)
- Model licence: apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
