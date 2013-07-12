//
//  LGWallOfFameViewController.h
//  Catmash
//
//  Created by Steven Beck on 7/11/13.
//  Copyright (c) 2013 TheLGs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LGWallOfFameViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property NSMutableArray *cats;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
