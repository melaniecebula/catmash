//
//  LGCatBattleViewController.m
//  Catmash
//
//  Created by Melanie Cebula on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGCatNewBattleViewController.h"
#import "LGCatStore.h"

@interface LGCatNewBattleViewController ()
@property LGCat *firstCat;
@property LGCat *secondCat;
@end

@implementation LGCatNewBattleViewController

- (id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self newCatBattle];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pickFirstCat:(id)sender {
    [self newCatBattle];
    [_firstCat updateCurrentScore:1.0];
}

- (IBAction)pickSecondCat:(id)sender {
    [self newCatBattle];
    [_secondCat updateCurrentScore:1.0];
    
}

- (void)newCatBattle {
    //set first cat to new cat, same with second cat
    NSArray *catPair = [[LGCatStore sharedStore] recieveRandomLGCatPair];
    _firstCat = [catPair objectAtIndex:0];
    _secondCat = [catPair objectAtIndex:1];
    [_catImageViewOne setImage:[_firstCat catImage] forState:UIControlStateNormal];
    [_catImageViewTwo setImage:[_secondCat catImage] forState:UIControlStateNormal];
    //update buttons
}


@end
