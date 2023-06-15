echo
echo "Welcome to all in one API application"
echo "There's a lot you can do with this application"
echo "Let's look at the various options avaiable"
echo 
echo
echo "if you are interested in any of the below subjects press 1"
echo "Newspaper - articles, movies and books"
echo "Countries - countries, currencies and capital cities"
echo "Numbers - trivia on dates, years and numbers"
echo "Jokes - Let's have a laugh"

echo 
echo

echo "if you are interested in any of the below subjects press 2"
echo "Bored - Let's do something fun, get suggestions"
echo "Memes - Want to make a fun meme or want to see some memes, let's get started"
echo "Food - Get a recipe to make your favourite dish"
echo "cocktail - Let's get brewing trivia, shall we?"

echo 
echo

read -p "Enter your choice: " choice

if [ $choice -eq 1 ]
then
echo "What specificaly are you interested in?"
echo "Newspaper - articles, movies and books - type 1"
echo "Countries - countries, currencies and capital cities - type 2"
echo "Numbers - trivia on dates, years and numbers - type 3"
echo "Jokes - Let's have a laugh - type 4"
read -p "Enter your choice: " choice
if [ $choice -eq 1 ]
then
./riyu44/newspaper.sh
fi
if [ $choice -eq 2 ]
then
./riyu44/countries.sh
fi
if [ $choice -eq 3 ]
then
./riyu44/numbers.sh
fi
if [ $choice -eq 4 ]
then
./riyu44/jokes.sh
fi

elif [ $choice -eq 2 ]
then
PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"
echo "Select a service you want to explore."
select API in Bored? MEME? COCKTAIL? FOOD? exit
do
  case $API in
    Bored?) 
./TusharApis/BoredAPI.sh ;;
    MEME?) 
./TusharApis/meme.sh    ;;
    COCKTAIL?)
./TusharApis/cocktail.sh    ;;
    FOOD?)
./TusharApis/food.sh     ;;
    exit)  echo "Exiting"; break ;;
    *) echo "Invalid selection" ;;
  esac
done
fi
