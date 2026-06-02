# ComfyUI Workflows

A public collection of ComfyUI workflows that I share, test, and improve over time.

The current focus is video and image-to-video workflows, especially LTX-based experiments shared alongside YouTube videos.

## Workflows

| Video bundle | Workflow | What it is |
| --- | --- |
| `ltx-2-camera-control-loras` | `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json` | LTX 2 camera-control LoRA workflow for jib and dolly movement tests. |
| `ltx-2-3-claymation-demo` | `workflows/ltx-2-3-claymation-demo/video_ltx2_3_it2v_prince-does-ai-claymation-demo.json` | LTX 2.3 image/text-to-video style workflow with video export through Video Helper Suite. |

More details are listed in [workflows.md](workflows.md).

The LTX 2 camera-control LoRA prompt table is here:

- [LTX 2 camera-control LoRA prompts](videos/ltx-2-camera-control-loras/prompts.md)

## How to Use

1. Download or clone this repo.
2. Open ComfyUI.
3. Open the matching folder under `workflows/`.
4. Drag a workflow `.json` file onto the ComfyUI canvas, or load it through the workflow menu.
5. Install any missing custom nodes that ComfyUI reports.
6. Add the required models/checkpoints to your local ComfyUI model folders.
7. Review the prompts, image inputs, output path, and video settings before running.

## Video Notes

Each YouTube video should get a matching slug in both places:

- `workflows/<video-slug>/` for workflow JSON files.
- `docs/videos/<video-slug>/` for prompts, notes, model requirements, and troubleshooting.

For example:

- Workflow: `workflows/ltx-2-camera-control-loras/video_ltx2_3_ia2v_working.json`
- Prompts: `docs/videos/ltx-2-camera-control-loras/prompts.md`

## Repo Policy Exception

This repo is a public workflow-sharing repo, not a packaged app. It does not use app-style version bumps, release changelogs, or generated changelog files for every workflow update.

## Requirements

This repo does not bundle models, checkpoints, or generated outputs.

Common requirements:

- [ComfyUI](https://github.com/comfyanonymous/ComfyUI)
- ComfyUI core nodes
- [ComfyUI-VideoHelperSuite](https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite)
- Any model files referenced by the workflow you are running

If a workflow fails to load, ComfyUI will usually tell you which node pack or model is missing.

## Repo Layout

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

## Notes

- These workflows are shared as practical starting points, not guaranteed one-click presets.
- Model names, paths, and custom node versions may differ between machines.
- Always check settings before running expensive video generations.

## License

No license has been added yet. Until a license is added, please treat this as shared for viewing and reference only.
