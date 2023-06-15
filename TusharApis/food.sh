PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"

echo "Want Information about Recipe? Select an option below"
arg1="Search by diet vegetarian or non vegetarian"
arg2="Search by cuisine"
arg3="Search Recipes by Ingredients"
arg4="Get Random Recipes"
arg5="Search for ingredient"
arg10="Search Grocery Products"
arg7="Get image of Recipe"
arg8="Get random food Joke"
arg9="Get Random food Trivia"
arg6="get recipe instructions"
API_KEY=c807916b27964f2c8b5a61c28aee9078
select API1 in "$arg1" "$arg2" "$arg3" "$arg4" "$arg5" "$arg6" "$arg7" "$arg8" "$arg9" "$arg10" Back
do
  case $API1 in
   "$arg1")    echo "Give your diet name"
   read dietName
   echo "Give your dish name"
   read dish
    echo "Listing recipe"
cur=$(curl "https://api.spoonacular.com/recipes/complexSearch?query=$dish&diet=$dietName&number=10&apiKey=$API_KEY" | jq -r '.results[] | .title')
echo "$cur"
;;
   "$arg2")    echo "Give your cuisine name"
   read dietName
    echo "Listing top 10 recipe"
cur=$(curl "https://api.spoonacular.com/recipes/complexSearch?cuisine=$dietName&number=10&apiKey=$API_KEY" | jq -r '.results[] | .title')
echo "$cur"
;;
   "$arg3")    echo "Give your space seperated ingredient name"
   read -a dietName
   str=""
for x in $dietName
do
str+=${x}
str+=","
done
str=${str%?}
    echo "Listing top 10 recipe name along with other ingredients"
cur=$(curl "https://api.spoonacular.com/recipes/findByIngredients?ingredients=$str&number=10&apiKey=$API_KEY" | jq -r '.[] | {"Title": .title},.missedIngredients[].name')
echo "$cur"
;;

"$arg4")  
    echo "Giving random recipe"
cur=$(curl "https://api.spoonacular.com/recipes/random?number=1&apiKey=$API_KEY" | jq -r '.recipes[] | .title')
echo "$cur"
;;
"$arg5")  echo "Name of your recipe"
read name
    echo "Giving ingredients"
id=$(curl "https://api.spoonacular.com/recipes/complexSearch?query=$name&number=1&apiKey=$API_KEY" | jq -r '.results[] | .id')
cur=$(curl "https://api.spoonacular.com/recipes/$id/information?apiKey=$API_KEY" | jq -r '. | {"Title": .title},.extendedIngredients[].name')
echo "$cur"
;;
"$arg6")  echo "Name of your recipe"
read name
    echo "Giving instructions"
id=$(curl "https://api.spoonacular.com/recipes/complexSearch?query=$name&number=1&apiKey=$API_KEY" | jq -r '.results[] | .id')
cur=$(curl "https://api.spoonacular.com/recipes/$id/information?apiKey=$API_KEY" | jq -r '. | {"Title": .title},.instructions')
echo "$cur"
;;

"$arg7")  echo "Name of your recipe"
read name
    echo "Giving image"
cur=$(curl "https://api.spoonacular.com/recipes/complexSearch?query=$name&number=1&apiKey=$API_KEY" | jq -r '.results[0] | .image')
curl -o temp3.jpg $cur
start temp3.jpg
;;
"$arg8") 
    echo "Displaying food joke"
cur=$(curl "https://api.spoonacular.com/food/jokes/random?apiKey=$API_KEY" | jq -r '.text')
echo "$cur"
;;
"$arg9") 
    echo "Displaying food trivia"
cur=$(curl "https://api.spoonacular.com/food/trivia/random?apiKey=$API_KEY" | jq -r '.text')
echo "$cur"
;;
"$arg10") echo "Give your product name"
read name
    echo "Displaying grocery product"
cur=$(curl "https://api.spoonacular.com/food/products/search?apiKey=$API_KEY&query=$name&number=10" | jq -r '. | .products[].title')
echo "$cur"
;;
    Back) echo "Reverting to main menu"; break;; 
    none) break ;;
    *) echo "Invalid selection" ;;
  esac
done