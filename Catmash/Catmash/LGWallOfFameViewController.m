//
//  LGWallOfFameViewController.m
//  Catmash
//
//  Created by Steven Beck on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGWallOfFameViewController.h"

@interface LGWallOfFameViewController ()



@end

#define kLGWallOfFameCellIdentifier @"LGWallOfFameCellIdentifier"

@implementation LGWallOfFameViewController

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
	
	[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kLGWallOfFameCellIdentifier];
	_tableView.delegate = self;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _cats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:kLGWallOfFameCellIdentifier forIndexPath:indexPath];
	
	

}

@end
