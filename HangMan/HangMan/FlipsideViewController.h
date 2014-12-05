//
//  FlipsideViewController.h
//  HangMan
//
//  Created by Jesse Bouma on 24-11-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *numGuessesLabel;
@property (weak, nonatomic) IBOutlet UISlider *numGuessesSlider;
- (IBAction)numGuessesChanged:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UILabel *wordLengthLabel;
@property (weak, nonatomic) IBOutlet UISlider *wordLengthSlider;

- (IBAction)wordLengthChanged:(UISlider *)sender;

@property NSUserDefaults *UserSettings;

- (IBAction)done:(id)sender;

@end
