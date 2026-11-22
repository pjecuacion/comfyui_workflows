# RIFE frame interpolation: 12 hard tests

Workflows from the Prince Does AI video "RIFE frame interpolation: 12 hard tests" (YouTube: [Prince Does AI](https://www.youtube.com/@princedoesai)). Everything ran locally in ComfyUI on one RTX 5090.

## How to use

Drag a `.json` file onto ComfyUI. These are API-format exports: ComfyUI lays the nodes out for you. Put the models below in the matching `ComfyUI/models/` folders first.

## Workflows

| File | Model | Settings used in the video |
| --- | --- | --- |
| `video_rife_interpolate.json` | interpolate-video | seed 42, aspect 16:9 |

## Models you need


## Nodes used

Missing ones: ComfyUI-Manager > Install Missing Custom Nodes.

`ComfyMathExpression`, `CreateVideo`, `GetVideoComponents`, `LoadRifeTensorrtModel`, `LoadVideo`, `PrimitiveInt`, `RifeTensorrt`, `SaveVideo`

## Licences

Each model has its own licence. Check its page before any commercial use.

Results depend on seed, settings and hardware: yours can differ. Prompts are in the video.
