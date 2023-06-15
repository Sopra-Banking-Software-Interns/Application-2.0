echo " Hi good to see someone interested in numbers"
echo " Here's something you would be interested in:"
while [ 0 ]
do
echo "what number fact do you want"
echo "fact about a date? - type 1"
echo "fact about a year? - type 2"
echo "fact about a number? - type 3"
echo "to exit the loop press 'Ctrl+C'"
read -p "Enter your choice: " choice

if [ $choice -eq 1 ]
then
read -p "Enter the date you want to search: (dd) " date
read -p "Enter the month you want to search: (mm)" month
curl -s "http://numbersapi.com/$month/$date/date"
fi
if [ $choice -eq 2 ]
then
read -p "Enter the year you want to search: " year
curl -s "http://numbersapi.com/$year/year"
fi
if [ $choice -eq 3 ]
then   
read -p "Enter the number you want to search: " number
curl -s "http://numbersapi.com/$number"
fi
echo 
echo
done