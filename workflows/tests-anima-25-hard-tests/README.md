# I Tested Anima: 25 Hard Anime Tests

Workflows from the Prince Does AI video "I Tested Anima: 25 Hard Anime Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_anima.json` | anima | seed 20261108, aspect 16:9, turbo False |

## Models you need

- `qwen_3_06b_base.safetensors`
- `qwen_image_vae.safetensors`
- `anima-base-v1.0.safetensors`
- `anima-turbo-lora-v0.2.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `EmptyLatentImage`, `KSampler`, `LoraLoaderModelOnly`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `ResolutionSelector`, `SaveImage`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: CircleStone Labs Non-Commercial License (https://huggingface.co/circlestone-labs/Anima/blob/main/LICENSE.md)
- Model licence: apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
