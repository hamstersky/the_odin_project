<h1>Mastermind</h1>

Implementation of the game "Mastermind" in Ruby as a project from 
<a href="www.theodinproject.com">The Odin Project</a>.

For rules check out <a href="https://en.wikipedia.org/wiki/Mastermind_(board_game)">Wikipedia</a>.

<h2>How to play?</h2>

Open mastermind.rb through the terminal/console.
The game will ask if you want to be the "guesser" or "codemaker". As a guesser
you try to guess the secret code of 4 non duplicated colors randomly generated 
by the computer while as a codemaker you create a code and let the computer guess it.
Type "guesser" or "codemaker" to make your choice.

<h3>Guesser</h3>

As the guesser you need to enter a guess which is a combination of 4 colors. <br>
The available colors to choose from are: <br>
<ul>
  <li>R - Red</li>
  <li>G - Green</li>
  <li>B - Blue</li>
  <li>Y - Yellow</li>
  <li>P - Purple</li>
  <li>W - White</li>
</ul>
Enter 4(!) letters(case insensitive) corresponding to a specific color 
separated by a single space. For example: <br>
r g b y

Read the feedback and repeat until you win or run out of turns(12).

<h3>Codemaker</h3>

As the codemaker you enter a combination of 4 non duplicated(!) colors which will become the 
secret code. To do that proceed the same as in the guesser section and then 
watch the computer trying to guess your code.