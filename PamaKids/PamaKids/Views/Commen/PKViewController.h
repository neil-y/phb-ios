//
//  PKViewController.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PKBackgroundTypeLeft = 0,
    PKBackgroundTypeMiddle,
    PKBackgroundTypeRight,
} PKBackgroundType;

@interface PKViewController : UIViewController<ApiNotify>{
    UIImageView *imgvNavBar;
    UILabel *labelTitle;
    NSString *strNaviTitle;
    UIButton *btnNaviLeft,*btnNaviRight;
    PKBackgroundType typeBackground;
}
@property (nonatomic, retain) NSString *strNaviTitle;
@property (nonatomic, assign) PKBackgroundType typeBackground;

- (void)createNaviBar;
- (void)createNaviBtnLeft:(UIImage *)img;
- (void)createNaviBtnRight:(UIImage *)img title:(NSString *)strTitle;

- (void)goBack;
- (void)clickRightNaviBtn;

@end
