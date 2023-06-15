echo "Press 1 to get an idea for your bucket list"
echo "Press 2 to download a HD Astronomy image by NASA"
read choice
if(( $choice==1 ))
    then 
        bash bucket_list_api.sh
    else
        bash nasa_image_api.sh
fi 