//
//  ACMenuViewController.m
//  AngelCare
//
//  Created by he chao on 13-4-13.
//  Copyright (c) 2013年 Leon. All rights reserved.
//

#import "ACMenuViewController.h"
#import "DDMenuController.h"
#import "ViewController.h"
//#import "ACSettingRootViewController.h"

@interface ACMenuViewController ()

@end

@implementation ACMenuViewController

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
    for (int i = 0; i < 7; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(0, 40*i, 320, 40)];
        btn.backgroundColor = [UIColor grayColor];
        btn.tag = i;
        if (btn.tag == 6) {
            [btn setFrame:CGRectMake(0, self.view.frame.size.height-40, 320, 40)];
        }
        [btn addTarget:self action:@selector(clickMenuBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        UILabel *labelBtnTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
        labelBtnTitle.backgroundColor = [UIColor clearColor];
        labelBtnTitle.textColor = [UIColor whiteColor];
        labelBtnTitle.textAlignment = UITextAlignmentCenter;
        [btn addSubview:labelBtnTitle];
        
        switch (i) {
            case 0:
                labelBtnTitle.text = @"发表";
                break;
            case 1:
                labelBtnTitle.text = @"圈子";
                break;
            case 2:
                labelBtnTitle.text = @"附近";
                break;
            case 3:
                labelBtnTitle.text = @"发表";
                break;
            case 4:
                labelBtnTitle.text = @"Message";
                break;
            case 5:
                labelBtnTitle.text = @"个人";
                break;
            case 6:
                labelBtnTitle.text = @"账号切换";
                break;
                
            default:
                break;
        }
    }
	// Do any additional setup after loading the view.
}

- (void)clickMenuBtn:(id)sender{
//    ACSettingRootViewController *controller = [[ACSettingRootViewController alloc] init];
//    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    ViewController *rootController = (ViewController *)delegate.viewController;
//    
//    DDMenuController *menuController = (DDMenuController *)delegate.menuController;
//    [menuController.tap setEnabled:NO];
//    [menuController.pan setEnabled:NO];
//    [menuController showRootController:YES];
//    
//    [rootController.navigationController pushViewController:controller animated:YES];
//    [controller performSelector:@selector(loadContent)];
//    [controller createNaviBtnLeft:[UIImage imageNamed:@"top_icon02"]];
//    controller.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
