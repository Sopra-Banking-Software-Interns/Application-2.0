data=$(curl --silent --location 'https://api.api-ninjas.com/v1/bucketlist' --header 'x-api-key: {{ secrets.BUCKET_LIST_API_KEY }}')
filtered=$(echo "$data" | jq -r .item)
echo $filtered