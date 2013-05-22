//
//  PKNewsInfoViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNewsInfoViewController.h"
#import "PKNewsInfoCell.h"

@interface PKNewsInfoViewController ()

@end

@implementation PKNewsInfoViewController

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
    self.strNaviTitle = @"新闻信息";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    UIImageView *imgLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_line"]];
    imgLine.center = CGPointMake(160, 59);
    [self.view addSubview:imgLine];
    [self loadTable];
    myTableView.frame = CGRectMake(0, 60, 320, self.view.frame.size.height-60);
	// Do any additional setup after loading the view.
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKNewsInfoCell *cell = (PKNewsInfoCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKNewsInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
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
