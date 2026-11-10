# Which AI Can Spell? Ideogram 4 vs Z-Image vs MOSS vs P-H3-Image: 15 Text Tests

Workflows from the Prince Does AI video "Which AI Can Spell? Ideogram 4 vs Z-Image vs MOSS vs P-H3-Image: 15 Text Tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_ideogram4.json` | Ideogram 4 | seed 20261107, aspect 16:9 |
| `image_z_image_turbo.json` | Z-Image Turbo | seed 20261107, aspect 16:9, width 1344, height 768 |
| `image_moss.json` | moss | seed 20261107, aspect 16:9, enhance False |
| `image_p_h3_image.json` | p-h3-image | seed 20261107, aspect 16:9 |

## Models you need

- `flux2-vae.safetensors`
- `ideogram4_fp8_scaled.safetensors`
- `qwen3vl_8b_fp8_scaled.safetensors`
- `ideogram4_unconditional_fp8_scaled.safetensors`
- `qwen_3_4b_fp8_mixed.safetensors`
- `ae.safetensors`
- `z_image_turbo_int8_convrot.safetensors`
- `moss_image_sft_int8_convrot.safetensors`
- `qwen3.5_9b_w4a8_gptq.safetensors`
- `flux2-vae_small.safetensors`
- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `p-h3-image_text_encoder_int8_convrot.safetensors`
- `p-h3-image_lora_bf16.safetensors`
- `p-h3-image_vae_int8_convrot.safetensors`
- `p-h3-image_prompt_upsampler_w4a8.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `CFGOverride`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfyNumberConvert`, `ComfySwitchNode`, `ConditioningZeroOut`, `CustomCombo`, `DualModelGuider`, `EmptyFlux2LatentImage`, `EmptySD3LatentImage`, `Ideogram4Scheduler`, `JsonExtractString`, `KSampler`, `KSamplerSelect`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3SigmaShift`, `ModelSamplingAuraFlow`, `PH3ImageConditioning`, `PreviewAny`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveImage`, `SkipLayerGuidanceDiTSimple`, `StringReplace`, `TextGenerate`, `TextGenerateV2`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (p-h3-image): other (https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
