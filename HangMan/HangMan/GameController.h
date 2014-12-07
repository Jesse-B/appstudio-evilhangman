//
//  GameController.h
//  HangMan
//
//  Created by Jesse Bouma on 05-12-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject
@property int *guessesLeft;
-(id)initWithWordLength:(int)wordLength withNumGuesses:(int)numGuesses;
@end
