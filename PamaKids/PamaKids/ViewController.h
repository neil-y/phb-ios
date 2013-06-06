//
//  ViewController.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKHomeViewController.h"
#import "PKLoginViewController.h"

@interface ViewController : UIViewController{
    //PKHomeViewController *controller;
    PKLoginViewController *loginCtrl;
    UINavigationController *naviCtrl;
}


@end
