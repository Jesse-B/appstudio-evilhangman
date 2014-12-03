//
//  FlipsideViewController.m
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "FlipsideViewController.h"

@interface FlipsideViewController ()

@end

@implementation FlipsideViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    // TODO: Maximale woordlengte bepalen
    
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
    self.numGuessesLabel.text = [NSString stringWithFormat:@"Number of guesses: %d", (int)sender.value];
}
- (IBAction)wordLengthChanged:(UISlider *)sender {
    self.wordLengthLabel.text = [NSString stringWithFormat:@"Word length: %d", (int)sender.value];
}
@end
