#Application uses countries api to get information about countries
echo "Hey! nice to see that you are interested in knowing about countries"
while [ 0 ]
do
echo
echo "Here's something you would be interested in:"
echo "search for a country - type 1"
echo "search for a currency - type 2"
echo "search for a capital city - type 3"
echo "to exit the loop press 'Ctrl+C'"
read -p "Enter your choice: " choice
if [ $choice -eq 1 ]
then
read -p "Enter the country you want to search: " country
country=$(sed -e 's/ /+/g' <<< "$country")
curl -s "https://restcountries.com/v3.1/name/$country" | jq -r '.[] | .name, .capital, .region, .subregion, .population, .currencies[].name, .languages[].name'
fi
if [ $choice -eq 2 ]
then
read -p "Enter the currency you want to search: " currency
currency=$(sed -e 's/ /+/g' <<< "$currency")
curl -s "https://restcountries.com/v3.1/currency/$currency" | jq -r '.[] | .name, .capital, .region, .subregion, .population, .currencies[].name, .languages[].name'
fi 
if [ $choice -eq 3 ]
then
read -p "Enter the capital city you want to search: " capital
capital=$(sed -e 's/ /+/g' <<< "$capital")
curl -s "https://restcountries.com/v3.1/capital/$capital" | jq -r '.[] | .name, .capital, .region, .subregion, .population, .currencies[].name, .languages[].name'
fi
done