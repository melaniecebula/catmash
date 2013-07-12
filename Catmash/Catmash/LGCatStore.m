//
//  LGCatStore.m
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGCatStore.h"
@interface LGCatStore()
{
    NSMutableArray *_catStore;
}
@end
@implementation LGCatStore
@synthesize catStore = _catStore;
+(id)allocWithZone:(NSZone *)zone{
    return [self sharedStore];
}
- (id)init{
    self = [super init];
    
    if(self){
        _catStore = [[NSMutableArray alloc] init];
    }
    
    return self;
}
+(LGCatStore *)sharedStore{
    static LGCatStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[super allocWithZone:nil] init];
    }
    
    return sharedStore;
}
-(void)addToCatStore:(LGCat *)cat{
    [_catStore addObject:cat];
}
@end
