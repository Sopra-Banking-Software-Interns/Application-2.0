PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"

echo "Want Information about Recipe? Select an option below"
arg1="Search by diet vegetarian or non vegetarian"
arg2="Search by cuisine"
arg3="Search Recipes by Ingredients"
arg4="Get Random Recipes"
arg5="Find a random cocktail"
arg6="Filter by alcoholic or non-alcoholic"

select API1 in "$arg1" "$arg2" "$arg3" "$arg4" "$arg5" "$arg6" Back
do
  case $API1 in
   "$arg1")    echo "Give the name you want to search cocktail by"
   read name
    echo "Listing upto 5 cocktails shown by name given"
cur=$(curl -X POST "www.thecocktaildb.com/api/json/v1/1/search.php?s=$name" | jq '.[] | .strDrink | limit(5;.[])')
echo "$cur"
;;
    Back) echo "Reverting to main menu"; break;; 
    none) break;;
    *) echo "Invalid selection" ;;
  esac
done