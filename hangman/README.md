# Hangman

Implementation of the popular Hangman game in Ruby for a project from [The Odin Project](http://www.theodinproject.com).

## Goal

The goal of this project was to practice serialization and working with files. This implementation of Hangman allows the player to save the state of the game at any point and load it afterwards. The saved state is stored in a YAML file using Ruby's YAML library.

## How to play

To run the game, open hangman.rb from the command-line. At the main menu start a new game or load a previously saved game by entering a number corresponding to either of the options.

Once the game starts, you are supposed to guess the secret word by guessing one letter each turn. After each turn you will be given feedback about the number of correct and incorrect guesses and also how many chances you have left. At any point you can save the game by typing 'save' and then giving a name to the save file.

To load a game, you need to select the corresponding option from the main menu and a list of saves will be displayed to you. Select the save you want to load by typing the number next to the save name. 

## Conclusion

There's a lot to improve in this implementation, especially in terms of object orientation as everything is just in one class. Also, invalid input can easily crash the game. 