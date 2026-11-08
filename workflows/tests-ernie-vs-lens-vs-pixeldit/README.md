# ERNIE-Image Turbo vs Lens Turbo vs PixelDiT: 20 Hard Prompts

Workflows from the Prince Does AI video "ERNIE-Image Turbo vs Lens Turbo vs PixelDiT: 20 Hard Prompts" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_ernie_image.json` | ernie-image | seed 20261108, aspect 16:9, width 1376, height 768, enhance False |
| `image_lens.json` | lens | seed 20261108, aspect 16:9, megapixels 1 |
| `image_pixeldit.json` | pixeldit | seed 20261108, aspect 16:9, megapixels 1 |

## Models you need

- `ernie-image-turbo.safetensors`
- `ministral-3-3b.safetensors`
- `flux2-vae.safetensors`
- `ernie-image-prompt-enhancer.safetensors`
- `gpt_oss_20b_nvfp4.safetensors`
- `lens_turbo_bf16.safetensors`
- `gemma_2_2b_it_elm_bf16.safetensors`
- `pixeldit_1300m_1024px_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicScheduler`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `ConditioningZeroOut`, `EmptyChromaRadianceLatentImage`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `KSampler`, `KSamplerSelect`, `ModelSamplingFlux`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveInt`, `PrimitiveStringMultiline`, `ResolutionSelector`, `SamplerCustom`, `SaveImage`, `StringReplace`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (ernie-image): apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)
- Model licence (lens): mit (https://huggingface.co/Comfy-Org/Lens)
- Model licence (lens): apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)
- Model licence (pixeldit): NVIDIA Source Code License v1 (non-commercial) (https://huggingface.co/nvidia/PixelDiT-1300M-1024px/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
