
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
                NSLog(@"Added cat: %@", newCat.catName);
			}
			[[NSNotificationCenter defaultCenter] postNotificationName:kLGCatStoreFinishedLoadingCatsNotification object:self];
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
    NSLog(@"Added cat: %@", cat.catName);
	PFObject *onlineCat = [PFObject objectWithClassName:@"Cat"];
	[onlineCat setObject:cat.catName forKey:@"name"];
	
	NSData *imageData = UIImageJPEGRepresentation(cat.catImage, 1.0f);
    CGFloat factor = 1.0;
	while (imageData.length > 10000000) {
        factor /= 2.0;
		imageData = UIImageJPEGRepresentation(cat.catImage, factor);
	}
	
	PFFile *imageFile = [PFFile fileWithData:imageData];
	[imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        [onlineCat setObject:imageFile forKey:@"image"];
        [onlineCat setObject:@(cat.currentScore) forKey:@"score"];
        [onlineCat saveInBackground];
    } progressBlock:nil];	
}

-(NSArray *)recieveRandomLGCatPair{
    NSUInteger randomPos1 = arc4random()%([_catStore count]);
    NSUInteger randomPos2 = arc4random()%([_catStore count]);
    
    while (randomPos1 == randomPos2){
        randomPos2 = arc4random()%([_catStore count]);
    }
    
    NSLog(@"%d / %d", randomPos1, randomPos2);
    
    NSArray *catPair = @[[_catStore objectAtIndex:randomPos1], [_catStore objectAtIndex:randomPos2]];
    
    return catPair;
}

@end
