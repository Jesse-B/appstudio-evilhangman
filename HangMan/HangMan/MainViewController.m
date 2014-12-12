//
//  MainViewController.m
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "MainViewController.h"
#import "GameController.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize textField = _textField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int numGuesses = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"numGuesses"];
    // If not yet set, set it to default 5
    if (numGuesses == 0){
        numGuesses = 5;
        [[NSUserDefaults standardUserDefaults] setInteger:5 forKey:@"numGuesses"];
    }
    int wordLength = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"wordLength"];
    // If not yet saved, set it to default 5
    if (wordLength == 0){
        wordLength = 5;
        [[NSUserDefaults standardUserDefaults] setInteger:5 forKey:@"wordLength"];
    }
    [self startNewGamewithWordLength:wordLength withNumGuesses:numGuesses];
    self.textField.delegate = self;
    self.textField.hidden = YES;
    [self.textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.textField becomeFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
    }
}

- (void)startNewGamewithWordLength:(int)wordLength withNumGuesses:(int)numGuesses {
    GameController *game = [[GameController alloc] initWithWordLength:wordLength withNumGuesses:numGuesses];
    self.game = game;
    // Set number of guesses label
    self.numGuessesLeftLabel.text = [NSString stringWithFormat:@"%d", numGuesses];
    // Set wordToGuess label
    self.wordToGuessLabel.text = [@"" stringByPaddingToLength:wordLength withString: @"-" startingAtIndex:0];
}

- (IBAction)newGameButtonPressed:(id)sender {
    [self startNewGamewithWordLength:[[NSUserDefaults standardUserDefaults] integerForKey:@"wordLength"] withNumGuesses:[[NSUserDefaults standardUserDefaults] integerForKey:@"numGuesses"]];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // To uppercase
    NSString *letter = [string uppercaseString];
    // Check if letter is valid
    if ([self.game isLetterValid:letter]) {
        // update words
        [self.game updateWordsForLetter:letter];
        // update wordToGuessLabel
        [self updateWordToGuessLabel];
        // update guessesLeftLabel
        self.game.guessesLeft = self.game.guessesLeft - 1;
        int newGuessesLeft = self.game.guessesLeft;
        self.numGuessesLeftLabel.text = [NSString stringWithFormat:@"%d", newGuessesLeft];
        // Check win or loss
        // Win if all letters guessed
        BOOL win = [self.wordToGuessLabel.text rangeOfString:@"-"].location == NSNotFound;
        BOOL loss = self.game.guessesLeft == 0;
        if(win){
            self.resultLabel.text = @"YOU WIN!";
            // Set all letters used so no more letters can be played
            self.game.usedLetters = [@[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",] mutableCopy];
        }
        else if (loss){
            self.resultLabel.text = @"YOU LOSE!";
            // Set all letters used so no more letters can be played
            self.game.usedLetters = [@[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",] mutableCopy];
        }
    }
    return YES;
}

-(void) updateWordToGuessLabel{
    NSMutableString *revealedLetters = [[NSMutableString alloc] init];
    // Check which used letters are in an example word of the remaining possible words
    NSString *exampleWord = [self.game.wordsWithLength objectAtIndex:0];
    for(int i = 0; i < exampleWord.length; i++){
        NSString * letter = [exampleWord substringWithRange:NSMakeRange(i, 1)];
        if ([self.game.usedLetters containsObject:letter]){
            [revealedLetters appendString:letter];
        }
        else{
            [revealedLetters appendString:@"-"];
        }

    }
    self.wordToGuessLabel.text = revealedLetters;
}
@end
