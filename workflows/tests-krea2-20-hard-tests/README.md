# I Tested Krea 2 Turbo: 20 Hard Tests

Workflows from the Prince Does AI video "I Tested Krea 2 Turbo: 20 Hard Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_krea2_turbo.json` | Krea 2 Turbo | seed 20261011, aspect 16:9, enhance False, sketch False |

## Models you need

- `krea2_turbo_int8_convrot.safetensors`
- `qwen3vl_4b_fp8_scaled.safetensors`
- `qwen_image_vae.safetensors`
- `krea2_darkbrush.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyLatentImage`, `KSampler`, `LoraLoaderModelOnly`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveStringMultiline`, `ResolutionSelector`, `SaveImage`, `StringConcatenate`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
