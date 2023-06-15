echo "Press 1 to get an idea for your bucket list"
echo "Press 2 to download a HD Astronomy image by NASA"
read choice
if[ "$choice" -eq 1 ]
    then 
        bash codeprakhar/bucket_list_api.sh
    else
        bash codeprakhar/nasa_image_api.sh
fi 