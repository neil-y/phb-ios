//
//  PKNewsListViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-4.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNewsListViewController.h"
#import "PKNewsDetailViewController.h"
#import "PKNewsCell.h"

@interface PKNewsListViewController ()

@end

@implementation PKNewsListViewController

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"新闻列表";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    [self loadTable];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKNewsCell *cell = (PKNewsCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    for (id element in [cell.contentView subviews]) {
        [element removeFromSuperview];
    }
    
    [cell performSelector:@selector(loadContent)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    PKNewsDetailViewController *controller = [[PKNewsDetailViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
