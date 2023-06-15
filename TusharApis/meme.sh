PS3="Enter your choice ==> 
-----(Press "Enter" to display the choices)-----
"
echo "Want to make a MEME? Select an option below"
select API1 in "Drake Hotline Bling" "Distracted Boyfriend" "Two Buttons" "Running Away Balloon" "Surprised Pikachu" Back
do
  case $API1 in
    "Drake Hotline Bling") 
    id=181913649
    select option in "Display sample image" "Write your texts" Back
    do
     case $option in
     "Display sample image") echo "displaying your image"
text0="TOP"
text1="BOTTOM"
echo $id     
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
     "Write your texts") echo "Input Top text"
read text0
echo "Input Bottom text"   
read text1     
echo "displaying your image"
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
Back) echo "Reverting back"; break;; 
none) break;;
*) echo "Invalid selection" ;;
    esac
done    
    ;;
    "Distracted Boyfriend") 
    id=112126428
    select option in "Display sample image" "Write your texts" Back
    do
     case $option in
     "Display sample image") echo "displaying your image"
text0="TOP"
text1="BOTTOM"
echo $id     
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')

curl -o temp.jpg $cur
start temp.jpg
     ;;
     "Write your texts") echo "Input Top text"
read text0
echo "Input Bottom text"   
read text1     
echo "displaying your image"
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
Back) echo "Reverting back"; break;; 
none) break;;
*) echo "Invalid selection" ;;
    esac
done    
    ;;
    "Two Buttons")  
    id=87743020
    select option in "Display sample image" "Write your texts" Back
    do
     case $option in
     "Display sample image") echo "displaying your image"
text0="TOP"
text1="BOTTOM"
echo $id     
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')

curl -o temp.jpg $cur
start temp.jpg
     ;;
     "Write your texts") echo "Input Top text"
read text0
echo "Input Bottom text"   
read text1     
echo "displaying your image"
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
      "Running Away Balloon") 
    id=131087935
    select option in "Display sample image" "Write your texts" Back
    do
     case $option in
     "Display sample image") echo "displaying your image"
text0="TOP"
text1="BOTTOM"
echo $id     
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')

curl -o temp.jpg $cur
start temp.jpg
     ;;
     "Write your texts") echo "Input Top text"
read text0
echo "Input Bottom text"   
read text1     
echo "displaying your image"
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
Back) echo "Reverting back"; break;; 
none) break;;
*) echo "Invalid selection" ;;
    esac
done    
    ;;
Back) echo "Reverting back"; break;; 
none) break;;
*) echo "Invalid selection" ;;
    esac
done    
    ;;
"Surprised Pikachu")
id=155067746
    select option in "Display sample image" "Write your texts" Back
    do
     case $option in
     "Display sample image") echo "displaying your image"
text0="TOP"
text1="BOTTOM"
echo $id     
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')

curl -o temp.jpg $cur
start temp.jpg
     ;;
     "Write your texts") echo "Input Top text"
read text0
echo "Input Bottom text"   
read text1     
echo "displaying your image"
cur=$(curl "https://api.imgflip.com/caption_image?template_id=$id&username=TUSHARKANTSAO&password=api_zenith&text0="$text0"&text1="$text1"" | jq -r '. | .data.url ')
curl -o temp.jpg $cur
start temp.jpg
     ;;
Back) echo "Reverting back"; break;; 
none) break;;
*) echo "Invalid selection" ;;
    esac
done
;;
    
    Back) echo "Reverting to main menu"; break;; 
    none) break;;
    *) echo "Invalid selection" ;;
  esac
done