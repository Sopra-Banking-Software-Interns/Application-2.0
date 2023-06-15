data=$(curl --location 'https://api.nasa.gov/planetary/apod?api_key={{ secrets.API_KEY_NASA }}')
url=(echo "$data" | jq -r .hdurl)
echo "$url"