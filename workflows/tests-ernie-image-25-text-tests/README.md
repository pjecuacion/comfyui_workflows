# ERNIE-Image Turbo: 25 Hard Text Tests

Workflows from the Prince Does AI video "ERNIE-Image Turbo: 25 Hard Text Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_ernie_image.json` | ernie-image | seed 20261108, enhance False |

## Models you need

- `ernie-image-turbo.safetensors`
- `ministral-3-3b.safetensors`
- `flux2-vae.safetensors`
- `ernie-image-prompt-enhancer.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyFlux2LatentImage`, `KSampler`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveStringMultiline`, `SaveImage`, `StringReplace`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
