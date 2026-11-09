"""Run a ComfyUI workflow through its API: send the job, wait until it's done, download the picture."""
import json, random, sys, time, urllib.parse, urllib.request

COMFY = "http://127.0.0.1:8188"
workflow = json.load(open("cat_poster_api.json"))
workflow["57_27"]["inputs"]["text"] = sys.argv[1] if len(sys.argv) > 1 else "a cat astronaut poster"
workflow["57_3"]["inputs"]["seed"] = random.randint(1, 10**9)

# 1. Send the job
req = urllib.request.Request(f"{COMFY}/prompt", json.dumps({"prompt": workflow}).encode(),
                             {"Content-Type": "application/json"})
prompt_id = json.load(urllib.request.urlopen(req))["prompt_id"]
print("sent, ticket:", prompt_id)

# 2. Is it done?
while True:
    history = json.load(urllib.request.urlopen(f"{COMFY}/history/{prompt_id}"))
    if prompt_id in history:
        break
    time.sleep(1)
image = history[prompt_id]["outputs"]["9"]["images"][0]

# 3. Get the picture
query = urllib.parse.urlencode({"filename": image["filename"], "type": "output"})
urllib.request.urlretrieve(f"{COMFY}/view?{query}", image["filename"])
print("saved", image["filename"])
