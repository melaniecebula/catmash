//
//  LGMainMenuViewController.m
//  Catmash
//
//  Created by Steven Beck on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGMainMenuViewController.h"
#import "LGWallOfFameViewController.h"
#import "LGProfileViewController.h"
#import "LGCatNewBattleViewController.h"
#import "LGCatStore.h"

@interface LGMainMenuViewController ()

@end

@implementation LGMainMenuViewController

- (id)init
{
	return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [LGCatStore sharedStore];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterWallOfFame:(id)sender
{
	LGWallOfFameViewController *wallVC = [LGWallOfFameViewController new];
	[self.navigationController pushViewController:wallVC animated:YES];
}

- (IBAction)profile:(id)sender {
    
    LGProfileViewController *profileVC = [LGProfileViewController new];
    [self.navigationController pushViewController:profileVC animated:YES];
}

- (IBAction)enterARound:(id)sender {
 
    LGCatNewBattleViewController *roundVC = [LGCatNewBattleViewController new];
        [self.navigationController pushViewController:roundVC animated:YES];
}
@end
