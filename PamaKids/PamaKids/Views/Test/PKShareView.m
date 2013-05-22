//
//  PKShareView.m
//  PamaKids
//
//  Created by leon on 13-4-29.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKShareView.h"

@implementation PKShareView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        UIImageView *imgBg = [[UIImageView alloc] initWithFrame:frame];
        imgBg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self addSubview:imgBg];
        
        [self loadContent];
    }
    return self;
}

- (void)loadContent{
    UIImageView *imgPanel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"share_panel_bg"]];
    imgPanel.center = self.center;
    imgPanel.userInteractionEnabled = YES;
    [self addSubview:imgPanel];
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(25, 36+(i==3?(45*i+8):45*i), 250, 34)];
        [btn setBackgroundImage:[[UIImage imageNamed:i==3?@"regist_btn":@"login_btn"] stretchableImageWithLeftCapWidth:20 topCapHeight:0] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgPanel addSubview:btn];
        
        NSString *strTitle = nil;
        switch (i) {
            case 0:
            {
                strTitle = @"分享到新浪微博";
            }
                break;
            case 1:
            {
                strTitle = @"分享到腾讯微博";
            }
                break;
            case 2:
            {
                strTitle = @"邮件分享";
            }
                break;
            case 3:
            {
                strTitle = @"取消";
            }
                break;
                
            default:
                break;
        }
        btn.tag = i;
        [btn setTitle:strTitle forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
}

- (void)clickBtn:(id)sender{
    switch (((UIButton *)sender).tag) {
        case 3:
        {
            [self removeFromSuperview];
        }
            break;
            
        default:
            break;
    }
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
