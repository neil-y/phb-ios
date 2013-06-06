//
//  ViewController.m
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ViewController.h"
#import "PKMenuViewController.h"
#import "PKSafeRootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    BOOL isLogin = NO;//[[NSUserDefaults standardUserDefaults] boolForKey:@"isLogin"];
    if (isLogin) {
        [self showMainPage];
    }
    else {
        [self showLoginPage];
    }
}

- (void)showLoginPage{
    loginCtrl = [[PKLoginViewController alloc] init];
    [self.navigationController pushViewController:loginCtrl animated:NO];
    //loginCtrl.view.frame = self.view.bounds;
    //naviCtrl = [[UINavigationController alloc] initWithRootViewController:loginCtrl];
    //naviCtrl.view.frame = self.view.bounds;
    //loginCtrl.view.frame = self.view.bounds;
    //[self.view addSubview:loginCtrl.view];
}

- (void)showMainPage{
    PKHomeViewController *controller = [[PKHomeViewController alloc] init];
    
    DDMenuController *menuCtrl = [[DDMenuController alloc] initWithRootViewController:controller];
    controller.slideOutCtrl = menuCtrl;
    PKMenuViewController *leftCtrl = [[PKMenuViewController alloc] init];
    menuCtrl.leftViewController = leftCtrl;
    
    PKSafeRootViewController *rightCtrl = [[PKSafeRootViewController alloc] init];
    menuCtrl.rightViewController = rightCtrl;
    
    //    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    ViewController *rootController = (ViewController *)delegate.viewController;
    [self.navigationController pushViewController:menuCtrl animated:NO];
}

- (void)clickBtn{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
