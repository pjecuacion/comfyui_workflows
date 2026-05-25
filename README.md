# ComfyUI Workflows

A public collection of ComfyUI workflows that I share, test, and improve over time.

The current focus is video and image-to-video workflows, especially LTX-based experiments.

## Workflows

| Workflow | What it is |
| --- | --- |
| `video_ltx2_3_it2v - prince does ai - claymation demo.json` | LTX 2.3 image/text-to-video style workflow with video export through Video Helper Suite. |

More details are listed in [docs/workflows.md](docs/workflows.md).

## How to Use

1. Download or clone this repo.
2. Open ComfyUI.
3. Drag a workflow `.json` file onto the ComfyUI canvas, or load it through the workflow menu.
4. Install any missing custom nodes that ComfyUI reports.
5. Add the required models/checkpoints to your local ComfyUI model folders.
6. Review the prompts, image inputs, output path, and video settings before running.

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
├── README.md
├── docs/
│   └── workflows.md
└── *.json
```

## Notes

- These workflows are shared as practical starting points, not guaranteed one-click presets.
- Model names, paths, and custom node versions may differ between machines.
- Always check settings before running expensive video generations.

## License

No license has been added yet. Until a license is added, please treat this as shared for viewing and reference only.
