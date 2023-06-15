PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"

echo "Want Information about COCKTAIL? Select an option below"
arg1="Search Cocktail by name"
arg2="List cocktails by first letter"
arg3="Search about Ingredient of a cocktail"
arg4="Instructions for cocktail by name"
arg5="Find a random cocktail"
arg6="Find whether your cocktail is alcoholic or not"
arg7="See image of your cocktail"

select API1 in "$arg1" "$arg2" "$arg3" "$arg4" "$arg5" "$arg6" "$arg7" Back
do
  case $API1 in
   "$arg1")    echo "Give the name you want to search cocktail by"
   read name
name=$(echo $name | tr ' ' '+')   
    echo "Listing cocktails shown by name given"
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?s="$name"" | jq -r '.drinks[] | .strDrink ')
if [[ $cur == null ]]
then 
 echo "No Cocktail found"
 continue
fi
echo "$cur"
;;

"$arg2")    echo "Give the first letter you want to search cocktails by"
   read name
name=$(echo $name | tr ' ' '+')    
    echo "Listing cocktails shown by first letter"
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?f="$name"" | jq -r '.drinks[] | .strDrink ')
if [[ $cur == null ]]
then 
 echo "Please type valid single letter"
 continue
fi
echo "$cur"
;;
"$arg3")    echo "Give the name of ingredient you want to search for"
   read name
name=$(echo $name | tr ' ' '+')    
    echo "Giving info of ingredient "
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?i="$name"" | jq -r '.ingredients[0] | .strIngredient,.strDescription ')
if [[ $cur == null ]]
then 
 echo "No Ingredients found"
 continue
fi
echo "$cur"
;;
"$arg4")    echo "Give the name of Cocktail you want instructions for"
   read name
name=$(echo $name | tr ' ' '+')    
    echo "Giving instructions for your cocktail "
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?s="$name"" | jq -r '.drinks[0] | .strDrink,.strInstructions' )
if [[ $cur == null ]]
then 
 echo "No Cocktail found"
 continue
fi
echo "$cur"
;;
"$arg5")   
    echo "Giving a random cocktail "
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/random.php" | jq -r '.drinks[0] | .strDrink' )
echo "$cur"
;;
"$arg6")    echo "Give the name of your Cocktail"
   read name
name=$(echo $name | tr ' ' '+')    
    echo "Returning whether your cocktail is alcoholic or not"
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?s="$name"" | jq -r '.drinks[0] | .strAlcoholic' )
if [[ $cur == null ]]
then 
 echo "No Cocktail found"
 continue
fi
echo "$cur"
;;
"$arg7")    echo "Give the name of your Cocktail"
   read name
name=$(echo $name | tr ' ' '+')    
    echo "Displaying image of your cocktail"
cur=$(curl -L "www.thecocktaildb.com/api/json/v1/1/search.php?s="$name"" | jq -r '.drinks[0] | .strDrinkThumb' )
if [[ $cur == null ]]
then 
 echo "No Cocktail found"
 continue
fi
curl -o temp2.jpg $cur
start temp2.jpg
;;
    Back) echo "Reverting to main menu"; break;; 
    none) break;;
    *) echo "Invalid selection" ;;
esac
done