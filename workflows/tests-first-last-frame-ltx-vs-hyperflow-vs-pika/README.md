# First + last frame to video: LTX 2.5 vs HyperFlow H3 Flash vs Pika H3 Flex, 12 hard tests

Workflows from the Prince Does AI video "First + last frame to video: LTX 2.5 vs HyperFlow H3 Flash vs Pika H3 Flex, 12 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_flf.json` | ltx-flf | seed 42, aspect 16:9, seconds 5, fps 24, width 1344, height 768, enhance False |
| `video_hyperflow_flf2v.json` | hyperflow-flf2v | seed 42, aspect 16:9, steps 6, width 1344, height 768, frames 124 |
| `video_pika_fl2va.json` | pika-fl2va | seed 42, aspect 16:9, seconds 5, strength 1.0 |

## Models you need

- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-audio-vae-bf16.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `gemma4_e2b_it_int8_convrot.safetensors`
- `minimax_h3_fl2va_hyperflow_flash_14b-int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`
- `minimax_h3_video_vae_fp16.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_fl2va_pruned_int8_convrot.safetensors`
- `pika_h3_flex_fl2va_v1_bf16.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `GetImageSize`, `HyperFlowLoader`, `HyperFlowSigmas`, `KSamplerSelect`, `LTXVAddGuide`, `LTXVAudioVAEDecode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVCropGuides`, `LTXVDualCFGGuider`, `LTXVEmptyLatentAudio`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LoadImage`, `LoraLoaderModelOnly`, `ManualSigmas`, `MiniMaxH3ImageToVideo`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResizeImageMaskNode`, `SamplerCustomAdvanced`, `SamplerEulerAncestral`, `SaveVideo`, `TextGenerateLTX2Prompt`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAEDecodeTiled`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

- Model licence (hyperflow-flf2v): other (https://huggingface.co/VideoRebirthAI/hyperflow-h3-flash/blob/main/LICENSE)
- Model licence (pika-fl2va): other (https://huggingface.co/Pika-Labs/Pika-H3-Flex/blob/main/LICENSE)

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
