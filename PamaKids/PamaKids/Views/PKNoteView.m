//
//  PKNoteView.m
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNoteView.h"

@implementation PKNoteView

- (id)initWithFrame:(CGRect)frame status:(BOOL)isLeft
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:isLeft?[UIImage imageNamed:@"frame2-left"]:[UIImage imageNamed:@"frame2-right"]];
        
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(15, 88, 200, 13)];
        labelTitle.backgroundColor = [UIColor clearColor];
        labelTitle.font = [UIFont systemFontOfSize:12];
        labelTitle.textColor = [kStrTitleColor colorWithHexString];
        labelTitle.text = @"健康日常饮食";
        [self addSubview:labelTitle];
        
        UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(labelTitle.frame.origin.x, labelTitle.frame.origin.y+labelTitle.frame.size.height, 200, 10)];
        labelTime.backgroundColor = [UIColor clearColor];
        labelTime.font = [UIFont systemFontOfSize:7];
        labelTime.textColor = [kStrTitleColor colorWithHexString];
        labelTime.text = @"2013-04-04";
        [self addSubview:labelTime];
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

@end
