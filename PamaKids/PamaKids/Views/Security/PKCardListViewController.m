//
//  PKCardListViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKCardListViewController.h"
#import "PKAddCardViewController.h"
#import "PKCardListCell.h"

@interface PKCardListViewController ()

@end

@implementation PKCardListViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];//[UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"宝宝安全卡";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadTable];
    
    [self createBtn];
	// Do any additional setup after loading the view.
}

- (void)createBtn{
    UIButton *btnCreate = [UIButton buttonWithType:UIButtonTypeCustom];
    btnCreate.frame = CGRectMake(20, self.view.frame.size.height-60, 320-40, 38);
    [btnCreate setBackgroundImage:[[UIImage imageNamed:@"next"] stretchableImageWithLeftCapWidth:30 topCapHeight:0] forState:UIControlStateNormal];
    [btnCreate setTitle:@"新建宝宝安全卡" forState:UIControlStateNormal];
    btnCreate.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnCreate addTarget:self action:@selector(clickCreateBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnCreate];
}

- (void)clickCreateBtn{
    PKAddCardViewController *controller = [[PKAddCardViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 136;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKCardListCell *cell = (PKCardListCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKCardListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
