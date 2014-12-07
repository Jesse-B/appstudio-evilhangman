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
    self.numGuessesLeftLabel.text = [NSString stringWithFormat:@"%d", numGuesses];
}

- (IBAction)newGameButtonPressed:(id)sender {
    [self startNewGamewithWordLength:[[NSUserDefaults standardUserDefaults] integerForKey:@"wordLength"] withNumGuesses:[[NSUserDefaults standardUserDefaults] integerForKey:@"numGuesses"]];
}
@end
