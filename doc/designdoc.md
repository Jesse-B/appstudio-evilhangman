#Design Document for Evil Hangman
Evil Hangman is a game where the user has to find a word by guessing letters like in normal Hangman. The evil part is that the computer doesn't actually pick a word but starts with a list of possible words. With each guess, the computer checks how many words contain the guessed letter and how many do not and picks the largest group. This way the user always has to guess from the largest amount of possible words.

## Classes and public methods
### Model classes
Class WordsModel
- getPossibleWords method, loads words.plist and turns this into a list or dict of possible words that can be used by the game. Bases words on the length of the word set by user in settings.

### Controller classes
Class GameViewController
- startGame method, returns setup for a new game
- processGuess method, processes a guessed letter by the user and updates a word list
- updateDrawing method, updates the drawing of hangman based on guesses
- updateWord method, updates the wordview based on guesses
- updateLetters method, updates the view showing the used letters

Class SettingsViewController
- setWordLength method, sets the length of the word to be guessed in NSUserDefaults
- setGuessesAmount method, sets the amount of guesses the user has in NSUserDefaults

### View classes
#### Views for GameViewController
Class NewGameView (Button)
- Invokes startGame method to start a new game.

Class InputLetterView (Button)
- Shows a list of letters that can be tapped on for a guess. Used letters will be grayed out.

Class HangmanDrawingView
- Shows a drawing of hangman. At each wrong guess a new part will be drawn. When all guesses have been used, the drawing is complete.

Class GuessView (Label)
- Shows the amount of guesses left for the user.

Class WordView (Label)
- Shows and underscore for each unguessed letter of the word. Shows the letters for correct guesses.

#### Views for SettingsViewController
Class WordLengthView (Slider)
- Slider to set the length of the word to be guessed

Class GuessesAmountView (Slider)
- Slider to set the amount of guesses the user has

## Sketches
![Sketch](https://raw.githubusercontent.com/Jesse-B/appstudio-evilhangman/master/doc/sketch.png "Sketch")

## API's and frameworks

## Database tables and fields
