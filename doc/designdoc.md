#Design Document for Evil Hangman
Evil Hangman is a game where the user has to find a word by guessing letters like in normal Hangman. The evil part is that the computer doesn't actually pick a word but starts with a list of possible words. With each guess, the computer checks how many words contain the guessed letter and how many do not and picks the largest group. This way the user always has to guess from the largest amount of possible words.

## Classes and public methods
### Model classes
Class WordsModel
- getPossibleWords(), returns a list of possible words that can be guessed by the user

### Controller classes
Class GameViewController
- startGame(), returns setup for a new game
- processGuess(), processes a guessed letter by the user and updates a word list
- updateDrawing(), updates the drawing of hangman based on guesses
- updateWord(), updates the wordview based on guesses
- updateLetters(), updates the view showing the used letters

Class SettingsViewController
- setWordLength()
- setGuessesAmount()

### View classes
Class InputLetterView
- Shows a list of letters that can be tapped on for a guess. Used letters will be grayed out.

Class HangmanDrawingView
- Shows a drawing of hangman. At each wrong guess a new part will be drawn. When all guesses have been used, the drawing is complete.

Class GuessView
- Shows the amount of guesses left for the user.

Class WordView
- Shows and underscore for each unguessed letter of the word. Shows the letters for correct guesses.

## Sketches
![Sketch](https://raw.githubusercontent.com/Jesse-B/appstudio-evilhangman/master/doc/sketch.png "Sketch")

## API's and frameworks

## Database tables and fields