//
//  LGCatStore.m
//  Catmash
//
//  Created by Chyheim Alon Jackson-Burgess on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGCatStore.h"
#import <Parse/Parse.h>

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

		PFQuery *query = [PFQuery queryWithClassName:@"Cat"];
		[query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
			
			for (PFObject *onlineCat in objects) {
				LGCat *newCat = [LGCat new];
				
				newCat.catName = [onlineCat objectForKey:@"name"];
				
				PFFile *imageFile = [onlineCat objectForKey:@"image"];
				NSData *imageData = [imageFile getData];
				newCat.catImage = [UIImage imageWithData:imageData];
				
				newCat.currentScore = [[onlineCat objectForKey:@"score"] doubleValue];
				
				[_catStore addObject:newCat];
			}
		}];
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
