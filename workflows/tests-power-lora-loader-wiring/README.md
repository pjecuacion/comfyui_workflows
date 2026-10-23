# MiniMax H3 + Power Lora Loader: LoRA wiring, step by step

Workflow from the Prince Does AI video "How to Use LoRA in ComfyUI: Wire It Right (Power Lora Loader)" (YouTube:
[Prince Does AI](https://www.youtube.com/@princedoesai)). It is ComfyUI's own "MiniMax H3: Text to Video" template
with one change: a Power Lora Loader (rgthree) right after Load Diffusion Model. Everything ran locally on one RTX 5090.

## How to use

Drag the `.json` file onto ComfyUI. It is a normal (UI-format) workflow: the wiring looks exactly like the video.
The real nodes are inside the subgraph: click the icon on the top right of the "Image to Video (MiniMax H3)" node.

## The one rule (why it is wired like this)

A LoRA changes the model, so it sits on the MODEL wire, right after Load Diffusion Model. Every wire that used to come
out of Load Diffusion Model now comes out of the Power Lora Loader: one into the template's Lightning LoRA, one into
the "If/Else Switch (Model)" `on_false` input. So the LoRAs work with turbo mode on or off. CLIP stays empty
(MiniMax H3 sends the text encoder straight into its own node; with no CLIP plugged in, the loader only changes the model).

Don't put your LoRA between the Lightning LoRA and the switch: with turbo mode off (the default) the switch skips that
path, and your LoRA does nothing, with no error.

## Workflow

| File | Settings used in the video |
| --- | --- |
| `video_minimax_h3_t2v_power_lora_loader.json` | Crayon 1.00 + Dutch Angle 1.00, seed 20261023, 16:9 at 0.6 MP, 5 s, turbo off |

Prompt: `crayonstyle, a busy city street with yellow taxis and people with umbrellas crossing in the rain`

## Models you need

- `minimax_h3_fl2va_pruned_int8_convrot.safetensors` (diffusion_models)
- `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors` (text_encoders)
- `minimax_h3_video_vae_int8_convrot.safetensors` and `minimax_h3_audio_vae_fp32.safetensors` (vae)
- `minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors` (loras; the template's Lightning LoRA, used only with turbo on)
- Links for all of them: https://huggingface.co/Comfy-Org/MiniMax-H3

The two LoRAs (put them in `models/loras/`; the file names here are my local names, so pick your downloaded files
in the Power Lora Loader rows):
- Crayon Drawings (MiniMax H3 style) by hoodtronik, trigger word `crayonstyle`: https://civitai.com/models/2992920
- H3 Dutch Angle Slider v1.0 by Cosmic_Crafter, no trigger word: https://civitai.com/models/2952026

## Nodes used

Custom node pack: [rgthree-comfy](https://github.com/rgthree/rgthree-comfy) (ComfyUI Manager > Custom Nodes Manager >
search "rgthree"). Others are core ComfyUI nodes.

`BasicGuider`, `BasicScheduler`, `CLIPLoader`, `ComfyMathExpression`, `ComfySwitchNode`, `CreateVideo`, `KSamplerSelect`,
`LoraLoaderModelOnly`, `MiniMaxH3ImageToVideo`, `Power Lora Loader (rgthree)`, `PrimitiveBoolean`, `PrimitiveFloat`,
`PrimitiveInt`, `RandomNoise`, `ResolutionSelector`, `SamplerCustomAdvanced`, `SaveVideo`, `UNETLoader`, `VAEDecode`,
`VAEDecodeAudio`, `VAELoader`

## Licences

Each model and LoRA has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ.
