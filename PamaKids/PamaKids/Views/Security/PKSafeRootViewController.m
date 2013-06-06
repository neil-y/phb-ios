//
//  PKSafeRootViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-14.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSafeRootViewController.h"
#import "PKMyCollectionViewController.h"
#import "PKSafeRecommendViewController.h"
#import "PKAddTopicViewController.h"
#import "PKCommentListViewController.h"
#import "PKUserViewController.h"
#import "PKCardViewController.h"
#import "PKNewsInfoViewController.h"
#import "PKSafeChatViewController.h"
#import "PKMyTopicViewController.h"
#import "PKCardListViewController.h"
#import "PKHomeViewController.h"
#import "AppDelegate.h"

@interface PKSafeRootViewController ()

@end

@implementation PKSafeRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshUserData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.typeBackground = PKBackgroundTypeRight;
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    numTopic = 8;
    [self createNaviBar];
    self.strNaviTitle = @"安全贴";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)refreshUserData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    labelNickname.text = [userDefaults valueForKey:@"nickname"];
}

- (void)loadContent{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    UIImageView *imgPanel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"safe_blue_bg"]];
    imgPanel.frame = CGRectMake(15, 50, imgPanel.frame.size.width, imgPanel.frame.size.height);
    imgPanel.userInteractionEnabled = YES;
    [self.view addSubview:imgPanel];
    
    imgAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar.jpg"]];
    imgAvatar.frame = CGRectMake(21, 16, 41, 41);
    imgAvatar.layer.cornerRadius = 21.5;
    [imgPanel addSubview:imgAvatar];
    
    labelNickname = [[UILabel alloc] initWithFrame:CGRectMake(imgAvatar.frame.origin.x+imgAvatar.frame.size.width+20, imgAvatar.frame.origin.y, 200, 16)];
    labelNickname.backgroundColor = [UIColor clearColor];
    labelNickname.textColor = [@"#333333" colorWithHexString];
    labelNickname.font = [UIFont systemFontOfSize:16];
    labelNickname.text = [userDefaults valueForKey:@"nickname"];
    [imgPanel addSubview:labelNickname];
    
    UILabel *labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(labelNickname.frame.origin.x, labelNickname.frame.origin.y+labelNickname.frame.size.height+8, 140, 22)];
    labelDescription.backgroundColor = [UIColor clearColor];
    labelDescription.textColor = [@"#333333" colorWithHexString];
    labelDescription.numberOfLines = 2;
    labelDescription.font = [UIFont systemFontOfSize:10];
    labelDescription.text = @"各种坑爹的描述,各种坑爹的描述,各种坑爹的描述";
    [imgPanel addSubview:labelDescription];
    
    UIImage *imgSetting = [UIImage imageNamed:@"setting"];
    UIButton *btnSetting = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSetting setBackgroundImage:imgSetting forState:UIControlStateNormal];
    [btnSetting setBackgroundImage:[UIImage imageNamed:@"setting_highlight"] forState:UIControlStateHighlighted];
    [btnSetting setFrame:CGRectMake(imgPanel.frame.size.width-24-imgSetting.size.width, 24, imgSetting.size.width, imgSetting.size.height)];
    [btnSetting addTarget:self action:@selector(clickSettingBtn) forControlEvents:UIControlEventTouchUpInside];
    [imgPanel addSubview:btnSetting];
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(imgPanel.frame.origin.x+10+(66+4)*i, imgPanel.frame.origin.y+imgPanel.frame.size.height-2, 66, 50)];
        [btn setTag:i];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [btn setBackgroundImage:[UIImage imageNamed:@"safe_btn"] forState:UIControlStateNormal];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, btn.frame.size.width-26, btn.frame.size.height)];
        label.numberOfLines = 2;
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [@"#333333" colorWithHexString];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = UITextAlignmentCenter;
        [btn addSubview:label];
        
        NSString *str = nil;
        switch (i) {
            case 0:
                str = @"我的收藏";
                break;
            case 1:
            {
                str = @"我的话题";
                if (numTopic>0) {
                    [self loadTopicCount:btn];
                }
                
            }
                break;
            case 2:
                str = @"我的评论";
                break;
            case 3:
                str = @"告诉编辑";
                break;
                
            default:
                break;
        }
        label.text = str;
        
        [self.view insertSubview:btn belowSubview:imgPanel];
    }
    
    for (int i = 0; i < 3; i++) {
        UIImage *imgBtn = [UIImage imageNamed:@"safe_btn2"];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:imgBtn forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(imgPanel.frame.origin.x, 203+(imgBtn.size.height+1)*i, imgBtn.size.width, imgBtn.size.height)];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn2:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        NSString *str = nil;
        switch (i) {
            case 0:
                str = @"新闻信息";
                break;
            case 1:
                str = @"育儿安全交流";
                break;
            case 2:
                str = @"安全推荐";
                break;
            case 3:
                str = @"安全卡";
                break;
                
            default:
                break;
        }
        [btn setTitle:str forState:UIControlStateNormal];
        [btn setTitleColor:[@"#333333" colorWithHexString] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgEnter = [UIImage imageNamed:@"card_enter"];
    [btn setImage:imgEnter forState:UIControlStateNormal];
    [btn setFrame:CGRectMake((320-imgEnter.size.width)/2.0, self.view.frame.size.height-imgEnter.size.height-2, imgEnter.size.width, imgEnter.size.height)];
    [btn addTarget:self action:@selector(enterCard) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)loadTopicCount:(UIButton *)btnTopic{
    UIImageView *imgMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"safe_mark"]];
    imgMark.center = CGPointMake(btnTopic.frame.origin.x+btnTopic.frame.size.width/2.0, btnTopic.frame.origin.y+btnTopic.frame.size.height+imgMark.frame.size.height/2.0-1);
    [self.view insertSubview:imgMark belowSubview:btnTopic];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-1, 0, imgMark.frame.size.width, imgMark.frame.size.height-5)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = UITextAlignmentCenter;
    label.font = [UIFont italicSystemFontOfSize:12];
    label.text = [NSString stringWithFormat:@"%d",numTopic];
    [imgMark addSubview:label];
}

- (DDMenuController *)getMenuCtrl{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).homeController.slideOutCtrl;
}

- (void)clickBtn:(id)sender{
    switch (((UIButton *)sender).tag) {
        case 0:
        {
            PKMyCollectionViewController *controller = [[PKMyCollectionViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            PKMyTopicViewController *controller = [[PKMyTopicViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            PKCommentListViewController *controller = [[PKCommentListViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3:
        {
            PKAddTopicViewController *controller = [[PKAddTopicViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)clickBtn2:(id)sender{
    switch (((UIButton *)sender).tag) {
        case 0:
        {
            PKNewsInfoViewController *controller = [[PKNewsInfoViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            PKSafeChatViewController *controller = [[PKSafeChatViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            PKSafeRecommendViewController *controller = [[PKSafeRecommendViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3:
        {
            PKCardViewController *controller = [[PKCardViewController alloc] init];
            [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)clickSettingBtn{
    PKUserViewController *controller = [[PKUserViewController alloc] init];
    [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
}

- (void)enterCard{
    PKCardListViewController *controller = [[PKCardListViewController alloc] init];
    [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
