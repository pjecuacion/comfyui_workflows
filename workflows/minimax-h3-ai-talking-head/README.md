# AI talking head (MiniMax H3 reference to video)

From the Prince Does AI video "How I Make My AI Talking Head in ComfyUI (3 Ways)".

- `ai_talking_head_r2v.json`: the workflow, laid out in six groups. Drag it onto the ComfyUI canvas.
- `prompts_8_scenes.txt`: the 8 scene prompts from the video, separated by `---` lines (the format Story Studio and
  Scene Runner read). Each one is a 15-second scene.

## Swap in your own references (group 1)
| Node | Put here |
| --- | --- |
| Reference Image | a sheet of photos of your face (several angles) |
| Reference Audio | a short, clean clip of your voice (about 7 seconds) |
| Studio Reference Image | a picture of the room you want to be in |
| Person 1 Attire Reference | a picture of the outfit |

The file names in the graph (`your_face_sheet.png`, `your_voice_7s.mp3`, `your_studio.png`, `your_outfit.png`) are
placeholders: upload your own files in those nodes. Your voice clip only shapes the voice; the saved video uses the
audio H3 generates.

## Models and LoRAs
- MiniMax H3 FastH3 4-step VSA model, ComfyUI int8 (Kijai): https://huggingface.co/Kijai/MiniMax-H3-experimental
- MiniMax H3 VAEs and text encoder: https://huggingface.co/Comfy-Org/MiniMax-H3
- Ref2V Turbo 8-step LoRA, strength 0.75 (Apache 2.0): https://huggingface.co/lightx2v/Minimax-h3-Turbo
- Realism People LoRA, strength 0.75, trigger `r34l1sm`: https://huggingface.co/fal/MiniMax-H3-Realism-People-LoRA
- Output: RIFE TensorRT 2x frames, then NVIDIA RTX Video Super Resolution 2x, saved at 48 fps.

On an RTX 5090 one 15-second clip took about 8 minutes. MiniMax H3 follows the MiniMax H3 Community License
(it excludes some regions; check it before commercial use).
