//
//  LGCat.m
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGCat.h"

@implementation LGCat
- (void)updateCurrentScore:(double)gainedPoints{
    double newScore = self.currentScore + gainedPoints;
    self.currentScore = newScore;
}
- (double)getExpectScore:(LGCat *)opponent{
    double truthDiff = ([opponent currentScore] - [self currentScore]) / 400;
    
    double raised = pow(10.0, truthDiff);
    double expectedScore = pow((1+raised), -1.0);
    
    return expectedScore;
}
-(double)getLGCatRanking{
    return 0.0;
}
@end
