//
//  LGCat.m
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGCat.h"

@implementation LGCat
- (void)updateCurrentScore:(NSInteger)gainedPoints{
    NSInteger *newScore = [self currentScore] + gainedPoints;
    [self setCurrentScore:newScore];
}
- (NSInteger *)getExpectValue:(LGCat *)opponent{
    
}
@end
