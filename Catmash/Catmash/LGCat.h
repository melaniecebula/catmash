//
//  LGCat.h
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LGCat : NSObject
@property double currentScore;
@property (nonatomic, strong) NSString *catName;
@property (nonatomic, strong) UIImage *catImage;

- (void)updateCurrentScore:(double)gainedPoints;
- (double)getExpectScore:(LGCat *)opponent;
@end
