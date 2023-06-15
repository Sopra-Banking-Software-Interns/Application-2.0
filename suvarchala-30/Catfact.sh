
echo "Do you wanna hear a cat fact (type y/n) ?"
read input

if [[ $input == "y" ]]
  then
  echo "enter max length of the fact u wanna hear"
  read len
 
    curl "https://catfact.ninja/fact?max_length=$len" \
    -H 'accept: application/json' \
    -H 'X-CSRF-TOKEN: O37gjy1U7OAjho1OMY2OvAF9Pq2xJpLxF4C0viaZ'
else
    echo "oh no! see ya next time"
fi

