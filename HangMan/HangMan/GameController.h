//
//  GameController.h
//  HangMan
//
//  Created by Jesse Bouma on 05-12-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject
@property NSInteger guessesLeft;
@property NSInteger wordLength;
@property NSMutableArray *usedLetters;
@property NSMutableArray *wordsWithLength;


-(id)initWithWordLength:(int)wordLength withNumGuesses:(int)numGuesses;
-(BOOL)isLetterValid:(NSString *) letter;
-(void)updateWordsForLetter:(NSString *) letter;
@end
