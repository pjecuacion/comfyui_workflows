# One fox, 50 styles: Qwen Image 2.1 vs Krea 2 Turbo vs Ideogram 4

Workflows from the Prince Does AI video "One fox, 50 styles: Qwen Image 2.1 vs Krea 2 Turbo vs Ideogram 4" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `image_qwen_2_1.json` | Qwen Image 2.1 | seed 42, aspect 1:1, enhance False |
| `image_krea2_turbo.json` | Krea 2 Turbo | seed 42, aspect 1:1, enhance False, sketch False |
| `image_ideogram4.json` | Ideogram 4 | seed 42, aspect 1:1 |

## Models you need

- `qwen_image_2.1_int8_convrot.safetensors`
- `qwen3vl_8b_int8_convrot.safetensors`
- `qwen_image_2.1_vae_bf16.safetensors`
- `qwen3.5_9b_qwen_image_2.1_pe_t2i.int8_convrot.safetensors`
- `krea2_turbo_int8_convrot.safetensors`
- `qwen3vl_4b_fp8_scaled.safetensors`
- `qwen_image_vae.safetensors`
- `krea2_darkbrush.safetensors`
- `flux2-vae.safetensors`
- `ideogram4_fp8_scaled.safetensors`
- `qwen3vl_8b_fp8_scaled.safetensors`
- `ideogram4_unconditional_fp8_scaled.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGOverride`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfyNumberConvert`, `ComfySwitchNode`, `ConditioningZeroOut`, `CustomCombo`, `DualModelGuider`, `EmptyFlux2LatentImage`, `EmptyLatentImage`, `Ideogram4Scheduler`, `JsonExtractString`, `KSampler`, `KSamplerSelect`, `LoraLoaderModelOnly`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveInt`, `PrimitiveStringMultiline`, `QwenImage21Cache`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveImage`, `SaveImageAdvanced`, `StringConcatenate`, `StringReplace`, `TextEncodeQwenImage21`, `TextGenerate`, `UNETLoader`, `VAEDecode`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
