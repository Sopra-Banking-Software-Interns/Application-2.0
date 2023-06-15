
echo "what do you wanna do today?
  1. See cute dog images?
  2. See a random image of a specific breed?
select one option"

read choice
if [[ $choice == "1" ]]
then
 URL=$(curl https://dog.ceo/api/breeds/image/random | jq -r '.message')
 curl -o dog.jpg $URL
 start dog.jpg
elif [[ $choice == "2" ]]
 then 
 echo "Enter the breed
 If you dont know the breeds you can check out the list of breeds by typing 'list'"
 read breed
 if [[ $breed == "list" ]]
    then
    curl https://dog.ceo/api/breeds/list/all | jq -r '. | .message.'
 else
 URL=$(curl https://dog.ceo/api/breed/$breed/images/random | jq -r '.message')
 curl -o dog.jpg $URL
 start dog.jpg
 fi
fi