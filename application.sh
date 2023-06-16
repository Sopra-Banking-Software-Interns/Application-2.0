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

echo "if you are interested in any of the below subjects press 3"
echo "Catfacts - Let's hear some cat facts"
echo "Dogfacts - Let's hear some dog facts"
echo "news - Let's get some news"
echo "recipe - Let's get some recipes"

echo
echo

echo "if you are interested in any of the below subjects press 4"
echo "Create a bucketlist - Let's create a bucketlist"
echo "Nasa images - let's explore space"

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
./riyu44/joke.sh
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

if [ $choice -eq 2 ]
then
echo "What specificaly are you interested in?"
echo "Bored - Let's do something fun, get suggestions - type 1"
echo "Memes - Want to make a fun meme or want to see some memes, let's get started - type 2"
echo "Food - Get a recipe to make your favourite dish - type 3"
echo "cocktail - Let's get brewing trivia, shall we? - type 4"
read -p "Enter your choice: " choice
if [ $choice -eq 1 ]
then
./TusharApis/BoredAPI.sh
fi
if [ $choice -eq 2 ]
then
./TusharApis/meme.sh
fi
if [ $choice -eq 3 ]
then
./TusharApis/food.sh
fi
if [ $choice -eq 4 ]
then
./TusharApis/cocktail.sh
fi
fi

if [ $choice -eq 3 ]
then   
echo "What specificaly are you interested in?"
echo "Catfacts - Let's hear some cat facts - type 1"
echo "Dogfacts - Let's hear some dog facts - type 2"
echo "news - Let's get some news - type 3"
echo "recipe - Let's get some recipes - type 4"
read -p "Enter your choice: " choice1
if [ $choice1 -eq 1 ]
then
./suvarchala-30/Catfact.sh
fi
if [ $choice1 -eq 2 ]
then
./suvarchala-30/dog.sh
fi
if [ $choice1 -eq 3 ]
then
./suvarchala-30/news.sh
fi
if [ $choice1 -eq 4 ]
then
./suvarchala-30/Recipies.sh
fi
fi

if [ $choice -eq 4 ]
then
./codeprakhar/powerstart.sh
fi