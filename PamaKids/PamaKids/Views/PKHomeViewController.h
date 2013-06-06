//
//  PKHomeViewController.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"
#import "DDMenuController.h"
#import "ApiCmdHomePage.h"

@interface PKHomeViewController : PKViewController{
    NSArray *arrayNormal,*arrayHighlight;
    UIImageView *imgBar;
    ApiCmdHomePage *apiHomePage;
    NSDictionary *dictCategory;
}
@property (nonatomic, strong) DDMenuController *slideOutCtrl;

@end
