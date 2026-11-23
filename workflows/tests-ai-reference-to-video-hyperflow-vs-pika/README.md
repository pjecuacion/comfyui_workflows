# AI reference to video: HyperFlow H3 Flash vs Pika H3 Flex, 12 hard tests

Workflows from the Prince Does AI video "AI reference to video: HyperFlow H3 Flash vs Pika H3 Flex, 12 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_hyperflow_ref2v.json` | hyperflow-ref2v | seed 42, aspect 16:9, steps 6, width 1344, height 768, frames 124 |
| `video_pika_ref2va.json` | pika-ref2va | seed 42, aspect 16:9, seconds 5, strength 1.0, megapixels 1.03 |

## Models you need

- `minimax_h3_ref2va_hyperflow_flash_14b-int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_ref2va_pruned_int8_convrot.safetensors`
- `pika_h3_flex_ref2va_v1_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `CLIPLoader`, `ComfyMathExpression`, `CreateVideo`, `HyperFlowLoader`, `HyperFlowSigmas`, `KSamplerSelect`, `LoadImage`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3ReferenceToVideo`, `PrimitiveFloat`, `PrimitiveStringMultiline`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (hyperflow-ref2v): other (https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash/blob/main/LICENSE)
- Model licence (pika-ref2va): other (https://huggingface.co/Pika-Labs/Pika-H3-Flex/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
