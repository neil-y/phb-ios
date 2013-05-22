//
//  PKTableViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-4.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"

@interface PKTableViewController : PKViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *myTableView;
    NSMutableArray *array;
}

- (void)loadTable;

@end
