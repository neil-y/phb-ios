//
//  PKViewController.m
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"

@interface PKViewController ()

@end

@implementation PKViewController
@synthesize strNaviTitle;

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

- (void)createNaviBar{
    imgvNavBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    imgvNavBar.userInteractionEnabled = YES;
    imgvNavBar.image = [UIImage imageNamed:@"top_bg"];//[[UIImage imageNamed:@"title_bar"] stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    [self.view addSubview:imgvNavBar];
    
    labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, imgvNavBar.frame.size.height)];
    labelTitle.textAlignment = NSTextAlignmentCenter;//UITextAlignmentCenter;
    labelTitle.font = [UIFont boldSystemFontOfSize:18.0];
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.shadowColor = [UIColor grayColor];
//    labelTitle.textColor = [kNaviTitleColor colorWithHexString];
//    labelTitle.shadowColor = [kNaviTitleShodowColor colorWithHexString];
    labelTitle.shadowOffset = CGSizeMake(1, 1);
    labelTitle.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labelTitle];
}

- (void)setStrNaviTitle:(NSString *)title{
    labelTitle.text = title;
}

#define BTN_PADDING_LEFT 15.0
#define BTN_PADDING_RIGHT 15.0

- (void)createNaviBtnLeft:(UIImage *)img{
    if (!btnNaviLeft) {
        btnNaviLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        btnNaviLeft.frame = CGRectMake(10, 0, 30, imgvNavBar.frame.size.height);//CGRectMake(0, 0, 63, imgvNavBar.frame.size.height);
        [btnNaviLeft addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
        [btnNaviLeft setImage:img forState:UIControlStateNormal];
        [self.view addSubview:btnNaviLeft];
    }
    [btnNaviLeft setImage:img forState:UIControlStateNormal];
}

- (void)createNaviBtnRight:(UIImage *)img title:(NSString *)strTitle{
    if (!btnNaviRight) {
        btnNaviRight = [UIButton buttonWithType:UIButtonTypeCustom];
        btnNaviRight.frame = CGRectMake(imgvNavBar.frame.size.width-80, 6, 73, 38);
        [btnNaviRight setBackgroundImage:img forState:UIControlStateNormal];
        [self.view addSubview:btnNaviRight];
    }
    [btnNaviRight setBackgroundImage:img forState:UIControlStateNormal];
    [btnNaviRight setTitle:strTitle forState:UIControlStateNormal];
    btnNaviRight.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnNaviRight addTarget:self action:@selector(clickRightNaviBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickRightNaviBtn{
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
