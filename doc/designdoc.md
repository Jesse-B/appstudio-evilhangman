#Design Document for Evil Hangman
Evil Hangman is a game where the user has to find a word by guessing letters like in normal Hangman. The evil part is that the computer doesn't actually pick a word but starts with a list of possible words. With each guess, the computer checks how many words contain the guessed letter and how many do not and picks the largest group. This way the user always has to guess from the largest amount of possible words.

## Classes and public methods
### Model classes
Class WordsModel
- getPossibleWords method, loads words.plist and turns this into a list or dict of possible words that can be used by the game. Bases words on the length of the word set by user in settings.

### Controller classes
#### Class GameController
- startGame method, returns setup for a new game
- processGuess method, processes a guessed letter by the user and updates a word list
  - updateDrawing method, updates the drawing of hangman based on guesses
  - updateWord method, updates the wordview based on guesses
  - updateLetters method, updates the view showing the used letters

#### Class SettingsViewController
- setWordLength method, sets the length of the word to be guessed in NSUserDefaults
- setGuessesAmount method, sets the amount of guesses the user has in NSUserDefaults

#### Class GameViewController
NewGame Button
- Invokes startGame method to start a new game.

InputLetter Button
- Shows a list of letters that can be tapped on for a guess. Used letters will be grayed out.

HangmanDrawing
- Shows a drawing of hangman. At each wrong guess a new part will be drawn. When all guesses have been used, the drawing is complete.

Guess Label
- Shows the amount of guesses left for the user.

Word Label
- Shows and underscore for each unguessed letter of the word. Shows the letters for correct guesses.

#### Class SettingsViewController
WordLength Slider
- Slider to set the length of the word to be guessed
- setWordLength method, sets the length of the word to be guessed in NSUserDefaults

GuessesAmount Slider
- Slider to set the amount of guesses the user has
- setGuessesAmount method, sets the amount of guesses the user has in NSUserDefaults

## Sketches
![Sketch](https://raw.githubusercontent.com/Jesse-B/appstudio-evilhangman/master/doc/sketch.png "Sketch")

## API's and frameworks

## Database tables and fields
