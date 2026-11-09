# Let AI run ComfyUI for you: the ComfyUI API in 3 requests

Files from the Prince Does AI video "Let AI Run ComfyUI For You (The ComfyUI API, Step by Step)"
([Prince Does AI](https://www.youtube.com/@princedoesai)). Made on one PC: ComfyUI 0.44.2, Z-Image Turbo, RTX 5090.

## The three requests

1. Send the job: `POST http://127.0.0.1:8188/prompt` with body `{"prompt": <API-format workflow>}`. You get a `prompt_id`.
2. Is it done? `GET http://127.0.0.1:8188/history/<prompt_id>` (empty `{}` until it is finished).
3. Get the picture: `GET http://127.0.0.1:8188/view?filename=<file>&type=output`.

Bonus: `GET /object_info` lists every node you have installed and every setting it takes.

## Files

| File | What it is |
| --- | --- |
| `ComfyUI_API.postman_collection.json` | The Postman collection from the video (Import it in Postman). |
| `cat_poster_api.json` | The Z-Image Turbo cat-poster workflow in **API format** (File > Export (API)). |
| `three_requests.py` | The small Python script: the same three requests, no extra packages. `python three_requests.py "your prompt"` |
| `claude_code_message.txt` | The exact message I gave Claude Code. Put it in a folder with `cat_poster_api.json` and paste it in. |

`cat_poster_api.json` points at my model file `z_image_turbo_int8_convrot.safetensors`. Change `unet_name` in node
`57_28` to your own Z-Image Turbo file. The prompt is node `57_27` (`text`), the seed is node `57_3` (`seed`), and the
picture is saved by node `9`.

## Things that tripped me up

- Send the exact same job twice and ComfyUI skips the work (no new picture). Change the seed.
- Send the normal workflow file instead of the API export and you get an error. Use File > Export (API).
- The API has no password. Don't open port 8188 to the internet.
