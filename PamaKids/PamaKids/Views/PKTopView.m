//
//  PKTopView.m
//  PamaKids
//
//  Created by leon on 13-4-25.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTopView.h"

@implementation PKTopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"frame1"]];
        
        UILabel *labelNote = [[UILabel alloc] initWithFrame:CGRectMake(15, 165, 200, 20)];
        labelNote.backgroundColor = [UIColor clearColor];
        labelNote.font = [UIFont systemFontOfSize:19];
        labelNote.textColor = [kStrOrangeColor colorWithHexString];
        labelNote.text = @"户外安全";
        [self addSubview:labelNote];
        
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, labelNote.frame.origin.y, 200, 13)];
        labelTitle.backgroundColor = [UIColor clearColor];
        labelTitle.font = [UIFont systemFontOfSize:12];
        labelTitle.textColor = [kStrTitleColor colorWithHexString];
        labelTitle.text = @"儿童智能手机 可实时追踪位置信息";
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
