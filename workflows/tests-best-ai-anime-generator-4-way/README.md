# Best AI Anime Generator: Anima vs FLUX 3 Klein Distilled vs Z-Image Turbo vs ERNIE-Image Turbo

Workflows from the Prince Does AI video "Best AI Anime Generator: Anima vs FLUX 3 Klein Distilled vs Z-Image Turbo vs ERNIE-Image Turbo" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_anima.json` | anima | seed 2026110904, aspect 16:9, turbo False |
| `image_flux3_klein_distilled.json` | FLUX 3 Image Klein | seed 2026110904, aspect 16:9, megapixels 1, enhance False |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 2026110904, aspect 16:9, width 1376, height 768 |
| `image_ernie_image.json` | ernie-image | seed 2026110904, aspect 16:9, width 1376, height 768, enhance False |

## Models you need

- `qwen_3_06b_base.safetensors`
- `qwen_image_vae.safetensors`
- `anima-base-v1.0.safetensors`
- `anima-turbo-lora-v0.2.safetensors`
- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-int8-convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `flux2-vae.safetensors`
- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `ernie-image-turbo.safetensors`
- `ministral-3-3b.safetensors`
- `ernie-image-prompt-enhancer.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `EmptySD3LatentImage`, `Flux3LayoutPrompt`, `KSampler`, `LoraLoaderModelOnly`, `ModelSamplingAuraFlow`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `ResolutionSelector`, `SaveImage`, `StringReplace`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (anima): CircleStone Labs Non-Commercial License (https://huggingface.co/circlestone-labs/Anima/blob/main/LICENSE.md)
- Model licence (anima): apache-2.0 (https://huggingface.co/Qwen/Qwen-Image-Edit-2511)
- Model licence (FLUX 3 Image Klein): apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)
- Model licence (Z-Image Turbo): apache-2.0 (https://huggingface.co/Boogu/Boogu-Image-0.1-Edit)
- Model licence (ernie-image): apache-2.0 (https://huggingface.co/baidu/ERNIE-Image-Turbo)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
