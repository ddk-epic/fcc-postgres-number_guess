#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

# get username
echo -e "\nEnter your username:"
read USERNAME
USERNAME_RESULT=$($PSQL "SELECT username FROM players WHERE username='$USERNAME'")

# if player is not found
if [[ -z $USERNAME_RESULT ]]
then
	INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")
	echo "Welcome, $USERNAME! It looks like this is your first time here.\n"
else
	GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")
	BEST_GAME=$($PSQL "SELECT MIN(number_guess) FROM games LEFT JOIN players USING(user_id) WHERE username='$USERNAME'")

	echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=1
echo "Guess the secret number between 1 and 1000:"
#echo $SECRET_NUMBER

# loop guess validation
while read GUESS
do
  #echo $GUESS_COUNT
	if [[ -z $GUESS || ! $GUESS =~ ^[0-9]+$ ]]
  then
		echo -e "\nThat is not an integer, guess again:"
	else
		if [[ $GUESS -eq $SECRET_NUMBER ]]
		then
			break;
    elif [[ $GUESS -gt $SECRET_NUMBER ]]
    then
			echo -e "\nIt's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
		then
			echo -e "\nIt's higher than that, guess again:"
    fi
	fi
	((GUESS_COUNT++))
done

# add to db
USER_ID=$($PSQL "SELECT user_id FROM players WHERE username='$USERNAME'")
INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id,secret_number,number_guess) VALUES($USER_ID,$SECRET_NUMBER,$GUESS_COUNT)")

# winning message
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
