invoke_url='https://ai.api.nvidia.com/v1/genai/stabilityai/stable-diffusion-3-medium'

authorization_header="Authorization: Bearer "
accept_header='Accept: application/json'
content_type_header='Content-Type: application/json'

data='{
  "prompt": "Vintage, steampunk-inspired airship soaring above a sprawling, Victorian-era cityscape, with intricate clockwork mechanisms and steam-powered engines",
  "cfg_scale": 5,
  "aspect_ratio": "16:9",
  "seed": 0,
  "steps": 50,
  "negative_prompt": ""
}'

response=$(curl --silent -i -w "\n%{http_code}" --request POST \
  --url "$invoke_url" \
  --header "$authorization_header" \
  --header "$accept_header" \
  --header "$content_type_header" \
  --data "$data"
)

http_code=$(echo "$response" | tail -n 1)

echo "$response" | awk '/{/,EOF-1'
