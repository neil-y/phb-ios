//
//  PKViewController.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKViewController : UIViewController{
    UIImageView *imgvNavBar;
    UILabel *labelTitle;
    NSString *strNaviTitle;
    UIButton *btnNaviLeft,*btnNaviRight;
}
@property (nonatomic, retain) NSString *strNaviTitle;

- (void)createNaviBar;
- (void)createNaviBtnLeft:(UIImage *)img;
- (void)createNaviBtnRight:(UIImage *)img title:(NSString *)strTitle;

- (void)goBack;

@end
