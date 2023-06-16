#!/bin/bash

# Function to retrieve a shuffled deck of cards from the Deck of Cards API
get_shuffled_deck() {
    url="https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1"
    response=$(curl -s "$url")
    deck_id=$(echo "$response" | jq -r '.deck_id')
    echo "$deck_id"
}

# Function to draw a card from the deck using the Deck of Cards API
draw_card() {
    deck_id="$1"
    url="https://deckofcardsapi.com/api/deck/$deck_id/draw/?count=1"
    response=$(curl -s "$url")
    card_value=$(echo "$response" | jq -r '.cards[0].value')
    echo "$card_value"
}

# Function to compare two cards based on their values
compare_cards() {
    player_card="$1"
    computer_card="$2"

    player_rank=$(get_card_rank "$player_card")
    computer_rank=$(get_card_rank "$computer_card")

    if ((player_rank > computer_rank)); then
        echo "player"
    elif ((player_rank < computer_rank)); then
        echo "computer"
    else
        echo "tie"
    fi
}

# Function to get the rank of a card
get_card_rank() {
    value="$1"

    case "$value" in
        "ACE") echo 14 ;;
        "KING") echo 13 ;;
        "QUEEN") echo 12 ;;
        "JACK") echo 11 ;;
        *) echo "$value" ;;
    esac
}

# Function to play the "Card War" game
play_card_war_game() {
    echo "Welcome to the Card War Game!"
    echo "----------------------------"
    echo "I will deal you and the computer each a card. The player with the higher card wins the round."

    echo ""
    read -p "Enter your name: " player_name
    echo ""

    echo "Let's begin, $player_name!"
    echo ""

    deck_id=$(get_shuffled_deck)

    player_wins=0
    computer_wins=0
    total_rounds=0

    while true; do
        player_card=$(draw_card "$deck_id")
        computer_card=$(draw_card "$deck_id")

        echo "Player's Card: $player_card"
        echo "Computer's Card: $computer_card"

        winner=$(compare_cards "$player_card" "$computer_card")

        if [[ "$winner" == "player" ]]; then
            echo "You win this round!"
            ((player_wins++))
        elif [[ "$winner" == "computer" ]]; then
            echo "Computer wins this round!"
            ((computer_wins++))
        else
            echo "It's a tie!"
        fi

        ((total_rounds++))

        echo ""

        read -p "Do you want to continue playing? [y/n]: " play_again
        echo ""

        if [[ "$play_again" == "n" || "$play_again" == "N" ]]; then
            break
        fi
    done

    echo "Game Over!"
    echo "----------"
    echo "Total Rounds Played: $total_rounds"
    echo "Player Wins: $player_wins"
    echo "Computer Wins: $computer_wins"
}

# Function to play the "Higher or Lower" game
play_higher_or_lower_game() {
    echo "Welcome to the Higher or Lower Game!"
    echo "-----------------------------------"
    echo "I will draw a card, and you have to guess whether the next card will be higher or lower."

    echo ""
    read -p "Enter your name: " player_name
    echo ""

    echo "Let's begin, $player_name!"
    echo ""

    deck_id=$(get_shuffled_deck)

    current_card=$(draw_card "$deck_id")
    echo "Current Card: $current_card"

    total_guesses=0
    correct_guesses=0

    while true; do
        ((total_guesses++))

        read -p "Will the next card be higher or lower than $current_card? [h/l]: " guess
        echo ""

        next_card=$(draw_card "$deck_id")
        echo "Next Card: $next_card"

        if [[ "$guess" == "h" || "$guess" == "H" ]]; then
            if (( $(get_card_rank "$next_card") > $(get_card_rank "$current_card") )); then
                echo "Correct!"
                ((correct_guesses++))
            else
                echo "Wrong!"
            fi
        elif [[ "$guess" == "l" || "$guess" == "L" ]]; then
            if (( $(get_card_rank "$next_card") < $(get_card_rank "$current_card") )); then
                echo "Correct!"
                ((correct_guesses++))
            else
                echo "Wrong!"
            fi
        else
            echo "Invalid input! Please enter 'h' for higher or 'l' for lower."
        fi

        current_card="$next_card"

        echo ""

        read -p "Do you want to continue playing? [y/n]: " play_again
        echo ""

        if [[ "$play_again" == "n" || "$play_again" == "N" ]]; then
            break
        fi
    done

    echo "Game Over!"
    echo "----------"
    echo "Total Guesses: $total_guesses"
    echo "Correct Guesses: $correct_guesses"
}

# Main function to start the game
main() {
    echo "Welcome to the Game Zone!"
    echo "-------------------------"
    echo "1. Higher or Lower"
    echo "2. Card War"

    echo ""
    read -p "Enter the number of the game you want to play: " game_choice
    echo ""

    case "$game_choice" in
        1)
            play_higher_or_lower_game
            ;;
        2)
            play_card_war_game
            ;;
        *)
            echo "Invalid game choice!"
            ;;
    esac
}

# Start the game
main
