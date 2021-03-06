//
//  MainViewController.h
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "FlipsideViewController.h"
#import "GameController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate, UITextFieldDelegate>

@property GameController *game;

@property (weak, nonatomic) IBOutlet UILabel *numGuessesLeftLabel;
@property (weak, nonatomic) IBOutlet UILabel *wordToGuessLabel;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *usedLettersLabel;

- (IBAction)newGameButtonPressed:(id)sender;
@end
