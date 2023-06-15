PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"
echo "Select an API you want to explore."

select API in Bored? MEME? COCKTAIL? FOOD? exit
do
  case $API in
    Bored?)
echo "Are you Bored? Select an option below"
select API1 in "Any Activity" "Recreational Activity" "Single Person Activity" Back
do
  case $API1 in
    "Any Activity") echo "Here is your activity suggestion"
    cur=$(curl https://www.boredapi.com/api/activity/ | jq '. | .activity ')
    echo "$cur"
    ;;
    "Recreational Activity")  echo "Here is your activity suggestion"
    cur=$(curl https://www.boredapi.com/api/activity?type=recreational | jq '. | .activity ')
    echo "$cur"
     ;;
    "Single Person Activity")  echo "Here is your activity suggestion" 
    cur=$(curl https://www.boredapi.com/api/activity?participants=1 | jq '. | .activity ')
    echo "$cur"
    ;;
    Back) echo "Reverting to main menu"; break;; 
    none) break;;
    *) echo "Invalid selection" ;;
  esac
done
    ;;
    MEME?)  echo "Want a Meme? Select an option below" ;;
    COCKTAIL?)  echo "Want Information about COCKTAIL? Select an option below" ;;
    FOOD?)  echo "Want Information about FOOD? Select an option below" ;;
    exit)  echo "Exiting"; break ;;
    *) echo "Invalid selection" ;;
  esac
done