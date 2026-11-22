# Remove people from video with AI: LTX 2.3 clean plate, 15 hard tests

Workflows from the Prince Does AI video "Remove people from video with AI: LTX 2.3 clean plate, 15 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_ltx2_3_clean_plate.json` | ltx23-clean-plate | seed 42, aspect 16:9 |

## Models you need

- `ltx-2.3-22b-dev-fp8.safetensors`
- `ltx-2.3-22b-distilled-lora-384.safetensors`
- `ltx-2.3-22b-ic-lora-clean-plate-1.0.safetensors`
- `gemma_3_12B_it_fp8_e4m3fn.safetensors`

## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`CFGGuider`, `CLIPTextEncode`, `CheckpointLoaderSimple`, `ComfyMathExpression`, `CreateVideo`, `EmptyLTXVLatentVideo`, `GetImageSize`, `GetVideoComponents`, `KSamplerSelect`, `LTXAVTextEncoderLoader`, `LTXAddVideoICLoRAGuide`, `LTXFloatToInt`, `LTXICLoRALoaderModelOnly`, `LTXVAudioVAEDecode`, `LTXVAudioVAELoader`, `LTXVConcatAVLatent`, `LTXVConditioning`, `LTXVCropGuides`, `LTXVEmptyLatentAudio`, `LTXVImgToVideoConditionOnly`, `LTXVPreprocess`, `LTXVSeparateAVLatent`, `LTXVSetAudioRefTokens`, `LTXVTiledVAEDecode`, `LoadImage`, `LoadVideo`, `LoraLoaderModelOnly`, `ManualSigmas`, `PrimitiveBoolean`, `PrimitiveFloat`, `RandomNoise`, `ResizeImageMaskNode`, `SamplerCustomAdvanced`, `SaveVideo`, `VAEEncodeAudio`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
