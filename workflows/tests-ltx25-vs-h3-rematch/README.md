# LTX 2.5 vs MiniMax H3 REMATCH: each model prompted its own way, 10 rounds

Workflows from the Prince Does AI video "LTX 2.5 vs MiniMax H3 REMATCH: each model prompted its own way, 10 rounds" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_i2v.json` | LTX 2.5 | seed 42, aspect 16:9, enhance False, seconds 5, megapixels 0.9 |
| `video_h3_i2v.json` | MiniMax H3 | seed 42, aspect 16:9, seconds 5, megapixels 0.9 |

## Models you need

- `gemma4_e2b_it_int8_convrot.safetensors`
- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-audio-vae-bf16.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `ltx-2.5-latent-spatial-upscaler-x2-bf16-1.0.safetensors`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `fastvideo_fasth3_8step_v2_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BlockSparseAttention`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `GetImageSize`, `ImageScaleToTotalPixels`, `KSamplerSelect`, `LTXVAudioVAEDecode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVDualCFGGuider`, `LTXVEmptyLatentAudio`, `LTXVImgToVideoInplace`, `LTXVLatentUpsampler`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LatentUpscaleModelLoader`, `LoadImage`, `ManualSigmas`, `MiniMaxH3ImageToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResizeImageMaskNode`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `TextGenerateLTX2Prompt`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAEDecodeTiled`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
