#script uses nyt apis to build a news search engine
echo "Hey! nice to see that people still read newspapers"
while [ 0 ]
do
echo
echo -e "Here's something you would be interested in:"
echo "search for an article - type 1"
echo "search for latest movie reviews - type 2"
echo "search for book reviews - type 3"
echo "to exit the loop press 'Ctrl+C'"
read -p "Enter your choice: " choice
if [ $choice -eq 1 ]
then
read -p "Enter the topic you want to search: " topic
topic=$(sed -e 's/ /+/g' <<< "$topic")
curl -s "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=$topic&api-key=1Kp50Hl0WvAQxsuMiDYjQ5mBQ16ypv9N&secret=GjFg6byyVjVlgMm0" | jq -r '. | .response.docs[].web_url'
fi
if [ $choice -eq 2 ]
then
read -p "Enter the movie name you want to search: " movie
movie=$(sed -e 's/ /+/g' <<< "$movie")
curl -s "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=$movie&api-key=1Kp50Hl0WvAQxsuMiDYjQ5mBQ16ypv9N&secret=GjFg6byyVjVlgMm0" | jq -r '. | .results[].link.url'
fi
if [ $choice -eq 3 ]
then
read -p "Enter the book name you want to get review on (please enter the exact book name): " book
book=$(sed -e 's/ /+/g' <<< "$book")
curl -s "https://api.nytimes.com/svc/books/v3/reviews.json?title=$book&api-key=1Kp50Hl0WvAQxsuMiDYjQ5mBQ16ypv9N&secret=GjFg6byyVjVlgMm0" | jq -r '. | .results[].url'
fi
done