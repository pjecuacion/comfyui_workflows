# Pika H3 Flex talking heads: 15 hard tests

Workflows from the Prince Does AI video "Pika H3 Flex talking heads: 15 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_pika_t2v.json` | pika-t2v | seed 20261105, aspect 16:9, megapixels 0.6, strength 1.0 |

## Models you need

- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `pika_h3_flex_fl2va_v1_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `CLIPLoader`, `ComfyMathExpression`, `CreateVideo`, `KSamplerSelect`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3ImageToVideo`, `PrimitiveFloat`, `PrimitiveInt`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence: other (https://huggingface.co/Pika-Labs/Pika-H3-Flex/blob/main/LICENSE)
- Model licence: MiniMax-H3 Community License (https://huggingface.co/FastVideo/FastH3-Omni-Comfy)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
