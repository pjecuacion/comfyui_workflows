# Spelling Rematch: ERNIE-Image Turbo vs Ideogram 4: 20 Hard Text Tests

Workflows from the Prince Does AI video "Spelling Rematch: ERNIE-Image Turbo vs Ideogram 4: 20 Hard Text Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_ernie_image.json` | ernie-image | seed 20261109, aspect 16:9, width 1376, height 768, enhance False |
| `image_ideogram4.json` | Ideogram 4 | seed 20261109, aspect 16:9 |

## Models you need

- `ernie-image-turbo.safetensors`
- `ministral-3-3b.safetensors`
- `flux2-vae.safetensors`
- `ernie-image-prompt-enhancer.safetensors`
- `ideogram4_fp8_scaled.safetensors`
- `qwen3vl_8b_fp8_scaled.safetensors`
- `ideogram4_unconditional_fp8_scaled.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGOverride`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfyNumberConvert`, `ComfySwitchNode`, `ConditioningZeroOut`, `CustomCombo`, `DualModelGuider`, `EmptyFlux2LatentImage`, `Ideogram4Scheduler`, `JsonExtractString`, `KSampler`, `KSamplerSelect`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveImage`, `StringReplace`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (ernie-image): apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
