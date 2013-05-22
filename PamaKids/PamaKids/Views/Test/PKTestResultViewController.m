//
//  PKTestResultViewController.m
//  PamaKids
//
//  Created by leon on 13-4-29.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTestResultViewController.h"
#import "PKShareView.h"

@interface PKTestResultViewController ()

@end

@implementation PKTestResultViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"安全检验";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 14)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = kLabelColor;
    label1.font = [UIFont systemFontOfSize:13];
    label1.textAlignment = UITextAlignmentCenter;
    label1.text = @"您的测验得分为";
    label1.center = CGPointMake(self.view.frame.size.width/2.0, 104);
    [self.view addSubview:label1];
    
    UIImageView *imgIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_icon"]];
    imgIcon.center = CGPointMake(self.view.frame.size.width/2.0, label1.frame.origin.y+label1.frame.size.height+20+imgIcon.frame.size.height/2.0);
    [self.view addSubview:imgIcon];
    
    UILabel *labelMark = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    labelMark.textAlignment = UITextAlignmentCenter;
    labelMark.backgroundColor = [UIColor clearColor];
    labelMark.textColor = [UIColor whiteColor];
    labelMark.font = [UIFont systemFontOfSize:50];
    labelMark.text = @"70";
    labelMark.center = CGPointMake(imgIcon.frame.size.width/2.0, imgIcon.frame.size.height/2.0-10);
    [imgIcon addSubview:labelMark];
    
    UILabel *labelNote = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    labelNote.textAlignment = UITextAlignmentCenter;
    labelNote.font = [UIFont systemFontOfSize:16];
    labelNote.textColor = [UIColor whiteColor];
    labelNote.backgroundColor = [UIColor clearColor];
    labelNote.text = @"总分100分";
    labelNote.center = CGPointMake(imgIcon.frame.size.width/2.0, imgIcon.frame.size.height/2.0+25);
    [imgIcon addSubview:labelNote];
    
    UIButton *btnShare = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgBtn = [UIImage imageNamed:@"regist_btn"];
    [btnShare setBackgroundImage:imgBtn forState:UIControlStateNormal];
    [btnShare setFrame:CGRectMake(0, 0, imgBtn.size.width, imgBtn.size.height)];
    btnShare.center = CGPointMake(self.view.frame.size.width/2.0, imgIcon.frame.origin.y+imgIcon.frame.size.height+20+btnShare.frame.size.height/2.0);
    [btnShare setTitle:@"分享结果" forState:UIControlStateNormal];
    btnShare.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnShare addTarget:self action:@selector(clickShareBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnShare];
}

- (void)clickShareBtn{
    PKShareView *shareView = [[PKShareView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:shareView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
