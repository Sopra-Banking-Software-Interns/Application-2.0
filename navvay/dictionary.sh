#!/bin/bash

# Prompt the user to enter a word
read -p "Enter a word: " word

# API request to retrieve word definition
response=$(curl -s "https://api.datamuse.com/words?sp=$word&md=d")

# Check if the response is empty, indicating an invalid word
if [ -z "$response" ]; then
  echo "Invalid word. Please enter a valid word."
  exit 1
fi

# Parse the JSON response and extract the part of speech and definition
part_of_speech=$(echo "$response" | jq -r '.[0].defs[0]' | awk -F '\t' '{print $1}')
definition=$(echo "$response" | jq -r '.[0].defs[0]' | awk -F '\t' '{print $2}')

# Format the part of speech
case "$part_of_speech" in
  "n") part_of_speech="Noun" ;;
  "v") part_of_speech="Verb" ;;
  "adj") part_of_speech="Adjective" ;;
  "adv") part_of_speech="Adverb" ;;
  "pron") part_of_speech="Pronoun" ;;
  "prep") part_of_speech="Preposition" ;;
  "conj") part_of_speech="Conjunction" ;;
  "interj") part_of_speech="Interjection" ;;
  *) part_of_speech="Other" ;;
esac

# Display the part of speech and definition
echo "Part of Speech: $part_of_speech"
echo "Definition: $definition"

# API request to retrieve synonyms
synonyms_response=$(curl -s "https://api.datamuse.com/words?rel_syn=$word")
synonyms=$(echo "$synonyms_response" | jq -r '.[].word')
if [ -z "$synonyms" ]; then
  echo "Synonyms: Not available"
else
  echo "Synonyms: $synonyms"
fi

# API request to retrieve antonyms
antonyms_response=$(curl -s "https://api.datamuse.com/words?rel_ant=$word")
antonyms=$(echo "$antonyms_response" | jq -r '.[].word')
if [ -z "$antonyms" ]; then
  echo "Antonyms: Not available"
else
  echo "Antonyms: $antonyms"
fi
