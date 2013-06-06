//
//  PKAddCommentView.m
//  PamaKids
//
//  Created by he chao on 13-6-3.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKAddCommentView.h"


@implementation PKAddCommentView
@synthesize mainCtrl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)loadContent{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    
    UIImageView *imgInputBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_topic_bg"]];
    imgInputBg.center = CGPointMake(self.frame.size.width/2.0, 55+imgInputBg.frame.size.height/2.0);
    CGRect frame = imgInputBg.frame;
    frame.size.height -=60;
    imgInputBg.frame = frame;
    imgInputBg.userInteractionEnabled = YES;
    [self addSubview:imgInputBg];
    
    UIImage *img = [UIImage imageNamed:@"input_type2"];
    CGFloat space = (imgInputBg.frame.size.width-img.size.width)/2.0-2;
    UIImageView *imgInput = [[UIImageView alloc] initWithFrame:CGRectMake(space+2, space, img.size.width, 90)];
    imgInput.userInteractionEnabled = YES;
    imgInput.image = [img stretchableImageWithLeftCapWidth:0 topCapHeight:15];
    
    [imgInputBg addSubview:imgInput];
    
    textView = [[CPTextViewPlaceholder alloc] initWithFrame:CGRectMake(5, 5, imgInput.frame.size.width-10, imgInput.frame.size.height-10)];
    [textView performSelector:@selector(becomeFirstResponder) withObject:nil afterDelay:0.5];
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = self;
    [imgInput addSubview:textView];
    textView.placeholder = @"评论内容";
    

    UIButton *btnSend = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgSend = [UIImage imageNamed:@"send_btn"];
    [btnSend setBackgroundImage:imgSend forState:UIControlStateNormal];
    [btnSend setTitle:@"发送" forState:UIControlStateNormal];
    [btnSend setFrame:CGRectMake(0, 0, imgSend.size.width, imgSend.size.height)];
    btnSend.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSend setCenter:CGPointMake(imgInputBg.frame.size.width/2.0, imgInputBg.frame.size.height-space-imgSend.size.height/2.0)];
    [btnSend addTarget:self action:@selector(clickSendBtn) forControlEvents:UIControlEventTouchUpInside];
    [imgInputBg addSubview:btnSend];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}

- (void)clickSendBtn{
    if ([mainCtrl respondsToSelector:@selector(sendComment:)]) {
        [mainCtrl performSelector:@selector(sendComment:) withObject:textView.text];
    }
}

@end
