# LTX 2.5 image-to-video: 12 hard tests

Workflows from the Prince Does AI video "LTX 2.5 image-to-video: 12 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_i2v.json` | LTX 2.5 | seed 20261013, aspect 16:9, enhance False, seconds 5 |

## Models you need

- `gemma4_e2b_it_int8_convrot.safetensors`
- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-audio-vae-bf16.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `ltx-2.5-latent-spatial-upscaler-x2-bf16-1.0.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `KSamplerSelect`, `LTXVAudioVAEDecode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVDualCFGGuider`, `LTXVEmptyLatentAudio`, `LTXVImgToVideoInplace`, `LTXVLatentUpsampler`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LatentUpscaleModelLoader`, `LoadImage`, `ManualSigmas`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResizeImageMaskNode`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `TextGenerateLTX2Prompt`, `UNETLoader`, `VAEDecodeTiled`, `VAELoader`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
