//
//  GameController.m
//  HangMan
//
//  Created by Jesse Bouma on 05-12-14.
//  Copyright (c) 2014 UvA. All rights reserved.
//

#import "GameController.h"

@implementation GameController
-(id)init{
    self = [super init];
    // Load words from words.plist into array
    self.words = [[NSMutableArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"]];
    // Calculate length of longest word     
    self.maxLength = [self.words valueForKeyPath: @"@max.length"];

    return self;
}

@end
