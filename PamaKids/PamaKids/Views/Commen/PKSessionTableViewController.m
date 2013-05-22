//
//  PKSessionTableViewController.m
//  PamaKids
//
//  Created by leon on 13-5-11.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSessionTableViewController.h"
#import "PKMyCollectionCell.h"


@interface PKSessionTableViewController ()

@end

@implementation PKSessionTableViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 33;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 32)];
    UILabel *labelSession = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 18)];
    labelSession.backgroundColor = [UIColor clearColor];
    labelSession.font = [UIFont systemFontOfSize:18];
    labelSession.textColor = [@"#95d4cb" colorWithHexString];
    labelSession.text = section==0?@"书籍":@"社区";
    [vi addSubview:labelSession];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, self.view.frame.size.width-30, 2)];
    line.image = [UIImage imageNamed:@"my_collection_seperate"];
    [vi addSubview:line];
    return vi;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKMyCollectionCell *cell = (PKMyCollectionCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKMyCollectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    for (id element in [cell.contentView subviews]) {
        [element removeFromSuperview];
    }
    
    UIView *selectedView = [[UIView alloc] initWithFrame:cell.bounds];
    UIImageView *imgVi = [[UIImageView alloc] initWithFrame:CGRectMake(45, 0, 320-45-20, 33)];
    imgVi.image = [UIImage imageNamed:@"my_collection_selected"];
    [selectedView addSubview:imgVi];
    
    cell.selectedBackgroundView = selectedView;
    
    [cell performSelector:@selector(loadContent)];
    
    return cell;
}

@end
