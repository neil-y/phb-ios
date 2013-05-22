//
//  PKPasswordRestoreViewController.m
//  PamaKids
//
//  Created by leon on 13-4-28.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKPasswordRestoreViewController.h"
#import "PKAddTopicViewController.h"

@interface PKPasswordRestoreViewController ()

@end

@implementation PKPasswordRestoreViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_bg"]];
    UIImageView *imgTop = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"restore_top_bg"]];
    [self.view addSubview:imgTop];
    [self createNaviBar];
    self.strNaviTitle = @"密码找回";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 90, 200, 15)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = kLabelColor;
    label.text = @"输入您注册时输入的邮箱或手机号";
    [self.view addSubview:label];
    
    UIImageView *imgInput = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password_bg"]];
    imgInput.frame = CGRectMake(label.frame.origin.x, label.frame.size.height+label.frame.origin.y+5, imgInput.frame.size.width, imgInput.frame.size.height);
    imgInput.userInteractionEnabled = YES;
    [self.view addSubview:imgInput];
    
    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, imgInput.frame.size.width-10, imgInput.frame.size.height)];
    myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    myTextField.font = [UIFont systemFontOfSize:14];
    myTextField.placeholder = @"邮箱或手机号";
    [imgInput addSubview:myTextField];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(imgInput.frame.origin.x+imgInput.frame.size.width-123, imgInput.frame.origin.y+imgInput.frame.size.height+20, 123, 35)];
    [btn setBackgroundImage:[UIImage imageNamed:@"login_btn"] forState:UIControlStateNormal];
    [btn setTitle:@"找回密码" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(clickFindBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)clickFindBtn{
    PKAddTopicViewController *controller = [[PKAddTopicViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
