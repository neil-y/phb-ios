//
//  PKUserViewController.m
//  PamaKids
//
//  Created by leon on 13-5-10.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKUserViewController.h"

@interface PKUserViewController ()

@end

@implementation PKUserViewController

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
    self.strNaviTitle = @"个人信息";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self createNaviBtnRight:[UIImage imageNamed:@"userinfo_btn"] title:@"保存"];
    [self loadContent];
	// Do any additional setup after loading the view.
}


- (void)loadContent{
    UIImageView *imgPanel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_info_bg"]];
    imgPanel.center = CGPointMake(self.view.frame.size.width/2.0, 50+imgPanel.frame.size.height/2.0);
    imgPanel.userInteractionEnabled = YES;
    [self.view addSubview:imgPanel];
    
    for (int i = 0; i < 4; i++) {
        NSString *str = nil;
        switch (i) {
            case 0:
                str = @"用户名";
                break;
            case 1:
                str = @"昵称";
                break;
            case 2:
                str = @"性别";
                break;
            case 3:
                str = @"头像";
                break;
                
            default:
                break;
        }
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, i==3?(18+39*i):(18+36*i), 200, 13)];
        label1.backgroundColor = [UIColor clearColor];
        label1.textColor = [@"#95d4cb" colorWithHexString];
        label1.font = [UIFont systemFontOfSize:11];
        label1.text = str;
        [imgPanel addSubview:label1];
        
        UIImageView *imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_info_acc"]];
        imgArrow.center = CGPointMake(imgPanel.frame.size.width-11-imgArrow.frame.size.width/2.0, i==3?(22+38*i):(22+35*i));
        [imgPanel addSubview:imgArrow];
        
        if (i<3) {
            //UILabel *labelContent = [[UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
            UIImageView *imgLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_info_line"]];
            imgLine.frame = CGRectMake(15, 40+36*i, imgLine.frame.size.width, imgLine.frame.size.height);
            [imgPanel addSubview:imgLine];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
