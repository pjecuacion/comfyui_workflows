# ComfyUI Workflows

A public collection of ComfyUI workflows that I share, test, and improve over
time. The current focus is video and image-to-video workflows.

## Workflow catalog

This README lists every workflow JSON currently under `workflows/`, including
the upstream/reference graphs retained for comparison. For extra workflow
details, see [the detailed catalog](workflows.md).

| Bundle | Workflow | What it is |
| --- | --- | --- |
| LTX 2.3 claymation demo | `workflows/ltx-2-3-claymation-demo/video_ltx2_3_it2v_prince-does-ai-claymation-demo.json` | LTX 2.3 image/text-to-video claymation-style demo. |
| LTX 2.3 CozyFelt LoRA | `workflows/ltx-2-3-cozyfelt-lora/CozyFeltLora_ltx2_3_it2v - prince does ai demo.json` | LTX 2.3 image/text-to-video demo using the CozyFelt LoRA. |
| LTX 2.3 IA2V | `workflows/ltx-2-3-ia2v-start-frame/video_ltx2_3_ia2v_start_frame.json` | Imported-audio workflow guided by a start frame. |
| LTX 2.3 IA2V | `workflows/ltx-2-3-ia2v-start-middle-last-frame/video_ltx2_3_ia2v_start_middle_last_frame.json` | Imported-audio workflow guided by start, middle, and last frames. |
| LTX 2.5 IA2V | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_start_frame_upscaled_interpolated.json` | Start-frame IA2V with imported audio, RTX 2x, and RIFE 2x. |
| LTX 2.5 IA2V | `workflows/ltx-2-5-ia2v/video_ltx2_5_ia2v_first_last_frame_upscaled_interpolated.json` | First/last-frame IA2V with imported audio, RTX 2x, and RIFE 2x. |
| LTX 2 camera-control LoRAs | `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json` | LTX 2.3 IA2V graph for jib and dolly LoRA tests. |
| LTX 2.3 IA2V last frame | `workflows/ltx2.3 ia2v-lastframe/video_ltx2.3_ia2v - working organized + last frame.json` | Organised LTX 2.3 graph with last-frame guidance. |
| LTX 2.3 clean plate LoRA | `workflows/ltx2.3-clean-plate-lora/ltx2.3-clean-plate-lora-silent-video-safe.json` | Silent-video-safe clean-plate LoRA variant. |
| LTX 2.3 IA2V legacy | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v - organized.json` | Earlier organised start-frame variant. |
| LTX 2.3 IA2V legacy | `workflows/ltx2.3.ia2v-start-middle-lastframe/video_ltx2.3_ia2v-with-middle-frame.json` | Earlier organised start/middle/last-frame variant. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8.json` | Base FP8 text-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_i2v fp8.json` | FP8 image-to-video graph. |
| MiniMax H3 FP8 | `workflows/minimaxh3-fp8/video_minimax_h3_t2v fp8 sageattention rtx upscaled interpolated.json` | Text-to-video with SageAttention, RTX, and RIFE. |
| MiniMax H3 Turbo | `workflows/minimax-h3-turbo/minimax_h3_t2v_turbo_int8_sage_rife48_rtx.json` | Local INT8 Turbo graph with SageAttention, RIFE, RTX, and 48 FPS output. |
| MiniMax H3 Turbo upstream | `workflows/minimax-h3-turbo/upstream/minimax_h3_t2v_turbo.json` | Unmodified upstream Turbo reference graph. |
| MiniMax H3 multishot | `workflows/minimax-h3-multishot/H3_Multishot_AIO_local-safetensors.json` | Local-ready all-in-one multishot graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_AIO.json` | Unmodified upstream all-in-one graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Multishot_MEMORY.json` | Unmodified upstream memory-oriented graph. |
| MiniMax H3 multishot upstream | `workflows/minimax-h3-multishot/upstream/H3_Keyframes.json` | Unmodified upstream keyframes graph. |
| MiniMax H3 multishot Turbo | `workflows/minimax-h3-multishot-turbo/H3_Multishot_Turbo_AIO_local-safetensors.json` | Local-safetensors graph with opt-in Turbo sampling. |
| MiniMax H3 face refine | `workflows/minimax-h3-fast-loras-face-refine/minimax_h3_fast_loras_face_refine.json` | Fast LoRA reference-to-video with a single-face refinement pass. |
| MiniMax H3 T2V variants | `workflows/minimax-h3-t2v-11-variants/video_minimax_h3_t2v Prince Does AI Demo.json` | T2V demo graph containing multiple configured variants. |
| MiniMax H3 caption scene 01 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_01_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 02 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_02_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 03 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_03_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 04 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_04_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 05 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_05_submitted_workflow.json` | Submitted text-pop caption scene export. |
| MiniMax H3 caption scene 06 | `workflows/minimax-h3-text-captions/my_minimax_story_minimal_text_pop_scene_06_submitted_workflow.json` | Submitted text-pop caption scene export. |
| FlashVSR | `workflows/flashvsr/FlashVSR-v1.1-ready.json` | FlashVSR v1.1 video-restoration/upscaling graph. |

## How to use

1. Download or clone this repo.
2. Open ComfyUI.
3. Drag a matching workflow JSON onto the ComfyUI canvas, or load it through the
   workflow menu.
4. Install any missing custom nodes reported by ComfyUI.
5. Add the required models/checkpoints to your local ComfyUI model folders.
6. Review the prompts, image inputs, output path, and video settings before
   running.

## Video notes

Each YouTube video should use a matching slug in both places:

- `workflows/<video-slug>/` for workflow JSON files.
- `docs/videos/<video-slug>/` for prompts, notes, model requirements, and
  troubleshooting.

Available notes include:

- [LTX 2.3 start-frame IA2V](videos/ltx-2-3-ia2v-start-frame/notes.md)
- [LTX 2.3 start/middle/last IA2V](videos/ltx-2-3-ia2v-start-middle-last-frame/notes.md)
- [LTX 2.5 IA2V](videos/ltx-2-5-ia2v/notes.md)
- [LTX 2 camera-control LoRAs](videos/ltx-2-camera-control-loras/notes.md)
  and [prompt table](videos/ltx-2-camera-control-loras/prompts.md)
- [MiniMax H3 Turbo](videos/minimax-h3-turbo/notes.md)
- [MiniMax H3 multishot](videos/minimax-h3-multishot/notes.md)

## Repo policy exception

This is a public workflow-sharing repo, not a packaged app. It does not use
app-style version bumps or generated changelog files for every workflow update.

## Requirements

This repo does not bundle models, checkpoints, or generated outputs. Common
requirements include:

- [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
- ComfyUI core nodes
- [ComfyUI-VideoHelperSuite](https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite)
- Any model files referenced by the workflow you are running

A workflow may require additional custom nodes and model files. If it fails to
load, ComfyUI will usually identify the missing dependency.

## Repo layout

```text
.
├── docs/
│   ├── README.md
│   ├── workflows.md
│   ├── videos/
│   │   └── <video-slug>/
│   ├── tasks/
│   └── bugs/
└── workflows/
    └── <video-slug>/
        └── *.json
```

## License

No license has been added yet. Until a license is added, please treat this as
shared for viewing and reference only.
