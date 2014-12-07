//
//  FlipsideViewController.m
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "FlipsideViewController.h"
#import "WordsController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // Set max value on slider for word length
    WordsController *words = [[WordsController alloc] init];
    NSNumber *maxLength = words.maxLength;
    self.wordLengthSlider.maximumValue = [maxLength integerValue];
    // Set saved user settings on sliders and labels
    int numGuesses = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"numGuesses"];
    self.numGuessesLabel.text = [NSString stringWithFormat:@"Number of guesses: %d", numGuesses];
    self.numGuessesSlider.value = numGuesses;
    int wordLength = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"wordLength"];
    self.wordLengthLabel.text = [NSString stringWithFormat:@"Word length: %d", wordLength];
    self.wordLengthSlider.value = wordLength;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}


- (IBAction)numGuessesChanged:(UISlider *)sender {
    // Update label
    self.numGuessesLabel.text = [NSString stringWithFormat:@"Number of guesses: %d", (int)sender.value];
    // Save value in settings
    [[NSUserDefaults standardUserDefaults] setInteger:sender.value forKey:@"numGuesses"];
}
- (IBAction)wordLengthChanged:(UISlider *)sender {
    // Update label
    self.wordLengthLabel.text = [NSString stringWithFormat:@"Word length: %d", (int)sender.value];
    // Save value in settings
    [[NSUserDefaults standardUserDefaults] setInteger:sender.value forKey:@"wordLength"];
}
@end
