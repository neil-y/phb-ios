//
//  AppDelegate.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class PKHomeViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    UINavigationController *naviCtrl;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) PKHomeViewController *homeController;

@end
