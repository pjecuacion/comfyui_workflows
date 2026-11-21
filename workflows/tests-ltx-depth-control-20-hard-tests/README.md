# LTX 2.5 depth control: 20 hard tests

Workflows from the Prince Does AI video "LTX 2.5 depth control: 20 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_union_control.json` | ltx-depth-control | seed 42, aspect 16:9, enhance False |
| `video_h3_t2v.json` | MiniMax H3 | seconds 5, aspect 16:9, megapixels 0.6, seed 42 |

## Models you need

- `ltx-2.5-audio-vae-bf16.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `ltx-2.5-latent-spatial-upscaler-x2-bf16-1.0.safetensors`
- `gemma4_e2b_it_int8_convrot.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `ltx-2.3-22b-ic-lora-union-control-ref0.5.safetensors`
- `video_depth_anything_vits.pth`
- `minimax_h3_video_vae_int8_convrot.safetensors`
- `minimax_h3_audio_vae_fp32.safetensors`
- `fastvideo_fasth3_8step_v2_pruned_int8_convrot.safetensors`
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`BasicGuider`, `BasicScheduler`, `BlockSparseAttention`, `CFGGuider`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfyNotNode`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `GemmaAPITextEncode`, `GetImageSize`, `GetVideoComponents`, `KSamplerSelect`, `LTXAddVideoICLoRAGuide`, `LTXFloatToInt`, `LTXICLoRALoaderModelOnly`, `LTXVAudioVAEDecode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVCropGuides`, `LTXVEmptyLatentAudio`, `LTXVImgToVideoInplace`, `LTXVLatentUpsampler`, `LTXVSeparateAVLatent`, `LatentUpscaleModelLoader`, `LoadImage`, `LoadVideo`, `LoadVideoDepthAnythingModel`, `ManualSigmas`, `MiniMaxH3ImageToVideo`, `MiniMaxH3SigmaShift`, `ModelAttentionBackend`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveStringMultiline`, `RandomNoise`, `ResizeImageMaskNode`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `StringContains`, `TextGenerateLTX2Prompt`, `UNETLoader`, `VAEDecode`, `VAEDecodeAudio`, `VAEDecodeTiled`, `VAELoader`, `VideoDepthAnythingOutput`, `VideoDepthAnythingProcess`

## Licences

Each model has its own licence. Check its page before any commercial use.

MiniMax H3 is under the MiniMax H3 Community License: its outputs must carry a clear "machine-generated" label, and the licence does not cover every country. Read it before you use the videos.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
