//
//  MainViewController.h
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "FlipsideViewController.h"

@interface MainViewController : UIViewController <FlipsideViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numGuessesLeftLabel;

- (IBAction)newGameButtonPressed:(id)sender;
@end
