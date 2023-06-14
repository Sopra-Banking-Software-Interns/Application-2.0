#makes a curl request to get a joke
echo "Looks like someone is in a mood to hear a joke"
echo "Here it goes"
curl -s https://icanhazdadjoke.com/slack | jq -r '. | .attachments[0].text'