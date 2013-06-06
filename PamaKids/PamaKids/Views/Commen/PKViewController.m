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
@synthesize strNaviTitle,typeBackground;

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

- (void)setTypeBackground:(PKBackgroundType)type{
    switch (type) {
        case PKBackgroundTypeLeft:
        {
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"left_bg-ip5":@"left_bg"]];
        }
            break;
        case PKBackgroundTypeMiddle:
        {
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"middle_bg-ip5":@"middle_bg"]];
        }
            break;
        case PKBackgroundTypeRight:
        {
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"right_bg-ip5":@"right_bg"]];
        }
            break;
            
        default:
            break;
    }
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

- (void)createATMHud:(NSString *)strContent{
    if (!hud) {
        hud = [[ATMHud alloc] initWithDelegate:self];
    }
    [self.view addSubview:hud.view];
    [hud setAccessoryPosition:2];
    [hud setCaption:[NSString stringWithFormat:@"%@",strContent]];
    [hud setActivity:YES];
    [hud show];
}

- (void)showATMHudSuccess:(NSString *)strContent{
    if (!hud) {
        [self createATMHud:strContent];;
    }
    [hud setCaption:[NSString stringWithFormat:@"%@",strContent]];
	[hud setActivity:NO];
	[hud setImage:[UIImage imageNamed:@"19-check"]];
	[hud update];
	[hud hideAfter:2.0];
}

- (void)showATMHudError:(NSString *)strContent{
    if (!hud) {
        [self createATMHud:strContent];;
    }
    [hud setCaption:[NSString stringWithFormat:@"%@",strContent]];
	[hud setActivity:NO];
	[hud setImage:[UIImage imageNamed:@"11-x"]];
	[hud update];
	[hud hideAfter:2.0];
}

- (void)hidATMHud{
    [hud hide];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
