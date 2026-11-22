# Video Depth Anything: 15 hard clips

Workflows from the Prince Does AI video "Video Depth Anything: 15 hard clips" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_5_t2v.json` | ltx-t2v | seconds 5, seed 42, enhance false |
| `video_depth_anything.json` | video-depth | seed 42, aspect 16:9 |

## Models you need

- `ltx-2.5-audio-vae-bf16.safetensors`
- `ltx-2.5-video-vae-bf16.safetensors`
- `ltx-2.5-22b-distilled-transformer-comfy-int8-convrot.safetensors`
- `gemma4_e2b_it_int8_convrot.safetensors`
- `gemma4-12b-with-proj-ltx-2.5-comfy-int8-convrot.safetensors`
- `video_depth_anything_vitl.pth`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGGuider`, `CLIPLoader`, `CLIPTextEncode`, `ComfyMathExpression`, `ComfyNotNode`, `ComfySwitchNode`, `CreateVideo`, `EmptyLTXVLatentVideo`, `GemmaAPITextEncode`, `GetVideoComponents`, `KSamplerSelect`, `LTXFloatToInt`, `LTXVAudioVAEDecode`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVEmptyLatentAudio`, `LTXVImgToVideoInplace`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LoadImage`, `LoadVideo`, `LoadVideoDepthAnythingModel`, `ManualSigmas`, `PreviewAny`, `PrimitiveBoolean`, `PrimitiveFloat`, `PrimitiveInt`, `PrimitiveStringMultiline`, `RandomNoise`, `ResizeImageMaskNode`, `SamplerCustomAdvanced`, `SaveVideo`, `StringContains`, `TextGenerateLTX2Prompt`, `UNETLoader`, `VAEDecodeTiled`, `VAELoader`, `VRAMCleanup`, `VideoDepthAnythingOutput`, `VideoDepthAnythingProcess`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
