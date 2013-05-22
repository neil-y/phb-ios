//
//  ViewController.m
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    controller = [[PKHomeViewController alloc] init];
//    controller.view.frame = self.view.bounds;
//    [self.view addSubview:controller.view];
    
    loginCtrl = [[PKLoginViewController alloc] init];
    naviCtrl = [[UINavigationController alloc] initWithRootViewController:loginCtrl];
    naviCtrl.view.frame = self.view.bounds;
    //loginCtrl.view.frame = self.view.bounds;
    [self.view addSubview:naviCtrl.view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)clickBtn{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
