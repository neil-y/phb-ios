//
//  PKToastView.m
//  PamaKids
//
//  Created by he chao on 13-5-4.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKToastView.h"

@implementation PKToastView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (void)showToast:(NSString *)strContent{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = strContent;
    CGSize constraintSize;
    constraintSize.width = 300;
    constraintSize.height = MAXFLOAT;
    CGSize stringSize = [strContent sizeWithFont:label.font constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    label.frame = CGRectMake(0, 0, stringSize.width, stringSize.height);
    
    UIImage *image = [UIImage imageNamed:@"toast"];
    UIImageView *imgToast = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, stringSize.width+10, image.size.height)];
    imgToast.image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:0];
    label.center = imgToast.center;
    [imgToast addSubview:label];
    
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    imgToast.center = CGPointMake(160, window.frame.size.height-100);
    [window addSubview:imgToast];
    [window bringSubviewToFront:imgToast];
    
    [UIView animateWithDuration:0.5 delay:2 options:UIViewAnimationOptionTransitionNone animations:^{
        imgToast.alpha = 0;
    } completion:^(BOOL finished) {
        [imgToast removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
