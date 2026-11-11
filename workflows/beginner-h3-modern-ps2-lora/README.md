# Make the PS2 game look with MiniMax H3: a beginner's step-by-step

This is for you if you saw the Prince Does AI video "MiniMax H3 LoRA Test: Modern PS2 Style, With vs Without" and
want the same look, but you're new to ComfyUI. There's no coding. It takes about 15 minutes the first time.

**The file you need:** `minimax_h3_modern_ps2_lora_beginner.json` (in this folder). It's ComfyUI's own
"MiniMax H3: Text to Video" template with the PS2 LoRA already wired in the right place, and it uses the same
prompt, seed and 4:3 size as scene 1 of the video.

> Sorry about the old file: the workflow first linked under the PS2 video (`tests-h3-modern-ps2-lora`) was an
> unfinished template, with a placeholder LoRA name and the wrong size. Use this one instead.

---

## Words you'll see (30-second glossary)

- **Workflow**: a saved ComfyUI "recipe" (a `.json` file). You drag it in, and all the boxes and wires appear.
- **Node**: one box in the workflow (for example "Load Diffusion Model").
- **LoRA**: a small add-on file (about 300 MB) that changes the style of the big model. Here it's the PS2 look.
- **Trigger words**: words you must put in the prompt to switch the LoRA on. For this LoRA: `modern ps2 style`.
- **Strength**: how strong the LoRA is. `1.0` is what I used. `0` means off.

---

## Step 1: Download the PS2 LoRA

1. Open the LoRA page on Civitai: https://civitai.com/models/2983280 ("Modern PS2 Style" by aziib).
2. At the top of the page, pick the **MiniMax H3** version. The page also has Krea 2 and Anima versions, and those
   won't work with H3.
3. Click **Download**. You get a file called `modern ps2 style h3.safetensors` (about 300 MB).

## Step 2: Get the LoRA into ComfyUI

**On RunningHub (cloud):** RunningHub can't see files on your computer. The LoRA has to be uploaded to your
RunningHub account first:

1. Click **Models** in the top bar, then **Upload Model**.
2. **Model Type:** `LoRA` (pick the wrong type and it won't show in the LoRA list). **Basic Model:** `minimax-h3`.
   **Model Source:** `Imported`. **Trigger Words:** `modern ps2 style`.
3. **Publish Range:** there is no "private" choice. `Link Access` is the closest (only people with the link see it).
   This puts a copy of someone else's LoRA on RunningHub, so check the LoRA's permissions on its Civitai page first.
4. Fill the other required boxes (name, tags, description, version, a cover picture), click **Upload LoRA**, pick
   the file, then **Confirm**. It shows up after about 2 minutes, in the editor's **Models** panel under
   **My Models** (not under Workspace > My Models, which is only for training).

(RunningHub's screens as of November 2026. They change often.)

**On your own PC:** put the file in `ComfyUI/models/loras/`. Then press `R` in ComfyUI (or restart it) so the
new file shows up.

## Step 3: Open the workflow

1. Download `minimax_h3_modern_ps2_lora_beginner.json` from this folder (click the file, then the download button).
2. On your PC: drag it onto the ComfyUI canvas. On RunningHub: click **Workspace**, then **Import** on the
   My Workflows tab, pick the `.json` file, and click the new workflow in the list to open it.
3. It only uses ComfyUI's built-in boxes, so there's no extra node pack to install.

## Step 4: Check the models (the big files)

The workflow uses ComfyUI's official MiniMax H3 files. On RunningHub these are normally already there. On your PC,
download them from https://huggingface.co/Comfy-Org/MiniMax-H3 and put each one in the folder shown:

| File | Folder |
| --- | --- |
| `minimax_h3_fl2va_pruned_int8_convrot.safetensors` | `models/diffusion_models/` |
| `qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors` | `models/text_encoders/` |
| `minimax_h3_video_vae_int8_convrot.safetensors` | `models/vae/` |
| `minimax_h3_audio_vae_fp32.safetensors` | `models/vae/` |
| `minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors` | `models/loras/` (only used with turbo on) |

If a model box shows a red name, click the name and pick the file you have.

## Step 5: Pick the PS2 LoRA

1. The real nodes are inside the big "MiniMax H3 + Modern PS2 Style LoRA" box. Click the small icon at its top
   right to open it.
2. Find the box called **Load LoRA (PS2 style)**. It sits right after **Load Diffusion Model**.
3. Click its `lora_name` and pick your PS2 file. On RunningHub this opens their model picker: choose the
   **My Models** tab and pick the LoRA you uploaded.
4. Make sure `strength_model` is **1.00**.
5. Go back out of the box (the arrow/breadcrumb at the top left).

## Step 6: Write the prompt (trigger words first)

The prompt must **start with** `modern ps2 style,`. This one is already in the file (scene 1 from the video):

```text
modern ps2 style, a young man in a dark jacket walks down a rainy city street at night, past glowing neon shop signs and puddles that reflect the lights. Tracking shot, medium shot
```

Keep the size at **4:3** (the LoRA maker's tip: it feels more like an old game). The file is set to 4:3 at 0.6 MP
(928 x 672), 5 seconds, seed `20261117`.

## Step 7: Run it

Click **Run** (or "Queue"). With turbo off, my RTX 5090 took about 2 minutes per clip once the models were loaded,
and about 11 minutes for this file's very first run (that run also loaded every model). Cloud times will be
different. The video appears in the Save Video box at the end: a game-looking hero walking down a neon street.

Want it faster? Switch **turbo_mode** on (in the big box's settings). It uses 8 steps instead of 20, and the
LoRA still works because of how it's wired (see below).

---

## The one trap (why the LoRA "does nothing")

A LoRA must sit on the **MODEL wire, right after Load Diffusion Model**. Every wire that used to come out of Load
Diffusion Model must now come out of your LoRA box.

In the official H3 template there are **two** wires leaving Load Diffusion Model: one goes to the turbo
(Lightning) LoRA, one goes to a switch. If you put your LoRA after the Lightning LoRA, then with turbo off (the
default) the switch skips that path. Your LoRA is ignored and **you get no error**, just a normal-looking video.
This file is already wired the right way. Full walkthrough video: https://www.youtube.com/watch?v=TNgXU0AmfnM

## Why not Power Lora Loader?

An earlier copy of this file used rgthree's **Power Lora Loader**. It works on a PC, but on RunningHub it opened
broken (strength `NaN`, LoRA name `[object Object]`), because RunningHub's version of that box is different.
This file uses ComfyUI's built-in **Load LoRA** (model only) instead. At strength 1.0 it gives the same result.

## Still not working? Quick checks

| What you see | Most likely fix |
| --- | --- |
| Video looks real/photo, not like a game | The LoRA isn't on the model path (see the trap), or the row is off, or strength is 0. |
| "PS2" written as text in the video | Normal: it happened in my test too. Try another seed. |
| Red box: "value not in list" | That model or LoRA file isn't there. Click the name and pick the one you have. |
| `NaN` or `[object Object]` in a LoRA box | You have the old copy with Power Lora Loader. Download this file again. |
| LoRA isn't in the list on RunningHub | Check it was uploaded as Model Type `LoRA` and wait 2 minutes. |
| Wrong LoRA version error / no effect | Make sure you downloaded the **MiniMax H3** version from Civitai, not Krea 2 or Anima. |
| Extra hands or odd faces | Same for me (1 in 13 scenes). Try a new seed. |

## Licences

The LoRA's Civitai page allows commercial use for images and renting on Civitai only, with no derivatives.
MiniMax H3 has its own licence (outputs must be labelled as machine-generated, and it doesn't cover every
country): https://huggingface.co/MiniMaxAI/MiniMax-H3/blob/main/LICENSE. This is a fan-made style LoRA. It isn't
made by or connected to Sony.

Results depend on seed, settings and hardware, so yours can differ from mine.
