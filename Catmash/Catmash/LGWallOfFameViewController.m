//
//  LGWallOfFameViewController.m
//  Catmash
//
//  Created by Steven Beck on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import "LGWallOfFameViewController.h"
#import "LGCat.h"
#import "LGCatStore.h"
@interface LGWallOfFameViewController ()



@end

#define kLGWallOfFameCellIdentifier @"LGWallOfFameCellIdentifier"

@implementation LGWallOfFameViewController

- (id)init
{
    return [self initWithNibName:nil bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
	
        
        _cats = [[LGCatStore sharedStore] catStore];
		
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
	[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kLGWallOfFameCellIdentifier];
	_tableView.delegate = self;
	_tableView.dataSource = self;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return _cats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:kLGWallOfFameCellIdentifier forIndexPath:indexPath];
	
	LGCat *cat = _cats[indexPath.row];
	cell.textLabel.text = cat.catName;
	
	return cell;
}

@end
