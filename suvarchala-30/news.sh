
echo "enter country"
read cont

curl https://newsapi.org/v2/top-headlines -G \
    -d country=$cont \
    -d apiKey=8c1705d528b145ab88433b44d7dacc5d | jq -r '. []'