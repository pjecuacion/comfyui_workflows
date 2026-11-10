# Fastest Local AI Image Model: Lens Turbo vs Z-Image Turbo vs FLUX 3 Klein Distilled vs P-H3-Image

Workflows from the Prince Does AI video "Fastest Local AI Image Model: Lens Turbo vs Z-Image Turbo vs FLUX 3 Klein Distilled vs P-H3-Image" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_lens.json` | lens | seed 20261109, aspect 16:9, megapixels 1 |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261109, aspect 16:9, width 1376, height 768 |
| `image_flux3_klein_distilled.json` | FLUX 3 Image Klein | seed 20261109, aspect 16:9, megapixels 1, enhance False |
| `image_p_h3_image.json` | p-h3-image | seed 20261109, aspect 16:9, megapixels 1 |

## Models you need

- `flux2-vae.safetensors`
- `gpt_oss_20b_nvfp4.safetensors`
- `lens_turbo_bf16.safetensors`
- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `qwen3.5_9b_flux3_prompt_upsampler_w4a8.safetensors`
- `flux3-image-klein-int8-convrot.safetensors`
- `qwen3vl_4b_int8_convrot.safetensors`
- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `p-h3-image_text_encoder_int8_convrot.safetensors`
- `p-h3-image_lora_bf16.safetensors`
- `p-h3-image_vae_int8_convrot.safetensors`
- `p-h3-image_prompt_upsampler_w4a8.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `CFGNorm`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `ConditioningZeroOut`, `CreateBoundingBoxes`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `EmptySD3LatentImage`, `Flux3LayoutPrompt`, `KSampler`, `KSamplerSelect`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3SigmaShift`, `ModelSamplingAuraFlow`, `ModelSamplingFlux`, `PH3ImageConditioning`, `PreviewAny`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustom`, `SamplerCustomAdvanced`, `SaveImage`, `TextGenerate`, `TextGenerateV2`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (lens): mit (https://huggingface.co/Comfy-Org/Lens)
- Model licence (p-h3-image): other (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
