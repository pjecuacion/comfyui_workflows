# LTX 2.5 lip sync (ia2v): 15 hard tests

Workflows from the Prince Does AI video "LTX 2.5 lip sync (ia2v): 15 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_ia2v.json` | ltx-ia2v | seed 42, aspect 16:9, megapixels 0.7, enhance False |

## Models you need

- `gemma_3_12B_it_fp8_e4m3fn.safetensors`
- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-audio-vae-bf16.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `ltx-2.5-latent-spatial-upscaler-x2-bf16-1.0.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `KSamplerSelect`, `LTXVAudioVAEDecode`, `LTXVAudioVAEEncode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVDualCFGGuider`, `LTXVImgToVideoInplace`, `LTXVLatentUpsampler`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LatentUpscaleModelLoader`, `LoadAudio`, `LoadImage`, `LoadRifeTensorrtModel`, `ManualSigmas`, `Power Lora Loader (rgthree)`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RTXVideoSuperResolution`, `RandomNoise`, `ResizeImageMaskNode`, `ResolutionSelector`, `RifeTensorrt`, `SamplerCustomAdvanced`, `SaveVideo`, `SetLatentNoiseMask`, `SolidMask`, `TextGenerateLTX2Prompt`, `TrimAudioDuration`, `UNETLoader`, `VAEDecodeTiled`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
