//
//  PKTableViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-4.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTableViewController.h"

@interface PKTableViewController ()

@end

@implementation PKTableViewController

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
	// Do any additional setup after loading the view.
}

- (void)loadTable{
    if (!myTableView) {
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50)];
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        myTableView.backgroundColor = [UIColor clearColor];
    }
    [self.view addSubview:myTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
