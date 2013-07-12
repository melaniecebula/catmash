//
//  LGCatStore.h
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LGCat.h"

#define kLGCatStoreFinishedLoadingCatsNotification @"LGCatStoreFinishedLoadingCatsNotification"

@interface LGCatStore : NSObject
@property (nonatomic, strong, readonly) NSArray *catStore;
+(LGCatStore *)sharedStore;
-(void)addToCatStore:(LGCat *)cat;
@end
