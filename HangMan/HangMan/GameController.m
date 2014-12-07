//
//  GameController.m
//  HangMan
//
//  Created by Jesse Bouma on 05-12-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "GameController.h"

@implementation GameController
-(id)initWithWordLength:(int)wordLength withNumGuesses:(int)numGuesses{
    self = [super init];
    self.guessesLeft = &(numGuesses);
    
    
    return self;
}
@end
