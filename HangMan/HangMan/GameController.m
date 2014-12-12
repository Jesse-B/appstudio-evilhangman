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

    // set numGuesses and wordLength for game
    self.guessesLeft = numGuesses;
    self.wordLength = wordLength;
    self.usedLetters = [[NSMutableArray alloc] init];

    // init list of words for given wordLength
    WordsController *words = [[WordsController alloc] init];
    NSArray * wordsWithLength = [words.words filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"length == %d", self.wordLength]];
    self.wordsWithLength = [wordsWithLength mutableCopy];
    return self;
}

- (BOOL)isLetterValid:(NSString *)letter {
    // Check if letter has been used before and if it is a letter
    NSArray *validLetters = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z",];
    BOOL letterUsed = [self.usedLetters containsObject:letter];
    BOOL letterValid = [validLetters containsObject:letter];
    if (!letterUsed && letterValid) {
        // If not used before, add to array of used letters
        [self.usedLetters addObject:letter];
        return true;
    }
    else {
        return false;
    }
}

-(void)updateWordsForLetter:(NSString *) letter{
    NSMutableDictionary *equivalenceClasses = [[NSMutableDictionary alloc] init];
    // For each word determine equivalence class
    for(NSString *word in self.wordsWithLength){
        NSMutableString *equivalenceClass = [[NSMutableString alloc] init];
        for(int i = 0; i < word.length; i++){
            NSString * lttr = [word substringWithRange:NSMakeRange(i, 1)];
            if ([letter isEqualToString:lttr]){
                NSLog(@"%@, %@", letter, lttr);
                [equivalenceClass appendString:lttr];
            }
            else{
                [equivalenceClass appendString:@"-"];
            }
        }
        // Add word to equivalence class in dict
        NSMutableArray *classWords = [equivalenceClasses objectForKey:equivalenceClass];
        if (classWords){
            [classWords addObject:word];
        }
        // classWords is nil if it does not exist
        else {
            classWords = [[NSMutableArray alloc] init];
            [classWords addObject:word];
            [equivalenceClasses setObject:classWords forKey:equivalenceClass];
        }
    }
    // get largest equivalence class
    int largestClassCount = 0;
    NSMutableArray *largestClassWords = [[NSMutableArray alloc] init];
    for (id key in equivalenceClasses) {
        NSMutableArray *classWords = [equivalenceClasses objectForKey:key];
        int count = classWords.count;
        NSLog(@"%@: %d", key, count);
        if (count > largestClassCount){
            largestClassCount = count;
            largestClassWords = classWords;
        }
    }
    // update words
    self.wordsWithLength = largestClassWords;
}

-(void)winOrLossCheck {
    
}
@end
