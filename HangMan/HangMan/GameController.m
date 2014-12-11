//
//  GameController.m
//  HangMan
//
//  Created by Jesse Bouma on 05-12-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "GameController.h"
#import "WordsController.h"

@implementation GameController
- (id)initWithWordLength:(int)wordLength withNumGuesses:(int)numGuesses{
    self = [super init];
    self.guessesLeft = numGuesses;
    self.usedLetters = [[NSMutableArray alloc] init];
//    WordsController *words = [[WordsController alloc] init];
//    
    return self;
}

- (BOOL)isLetterValid:(NSString *)letter {
    BOOL letterUsed = [self.usedLetters containsObject:letter];
    if (!letterUsed) {
        [self.usedLetters addObject:letter];
        return true;
    }
    else {
        return false;
    }
}

-(void)submitLetter:(NSString *) letter{
    
}
@end
