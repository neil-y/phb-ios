//
//  PKSafeChatCell.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSafeChatCell.h"

@implementation PKSafeChatCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadContent{
    UIImageView *imgCellBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"comment_cell_bg"]];
    //imgCellBg.userInteractionEnabled = YES;
    imgCellBg.center = CGPointMake(160, imgCellBg.frame.size.height/2.0+3);
    //imgCellBg.center = self.center;
    [self.contentView addSubview:imgCellBg];
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake((imgCellBg.frame.size.height-40)/2.0, (imgCellBg.frame.size.height-40)/2.0, 40, 40)];
    imgAvatar.layer.cornerRadius = 40.0/2.0;
    imgAvatar.layer.masksToBounds = YES;
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgCellBg addSubview:imgAvatar];
    
    UILabel *labelUserName = [[UILabel alloc] initWithFrame:CGRectMake(2*imgAvatar.frame.origin.x+imgAvatar.frame.size.width, imgAvatar.frame.origin.y, 200, 15)];
    labelUserName.backgroundColor = [UIColor clearColor];
    labelUserName.font = [UIFont boldSystemFontOfSize:15];
    labelUserName.text = @"坑爹";
    [imgCellBg addSubview:labelUserName];
    
    UIImageView *imgMark = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"commend_num"]];
    imgMark.frame = CGRectMake(imgCellBg.frame.size.width-11-imgMark.frame.size.width, 14, imgMark.frame.size.width, imgMark.frame.size.height);
    [imgCellBg addSubview:imgMark];
    
    UILabel *labelCount = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, imgMark.frame.size.width, 13)];
    labelCount.backgroundColor = [UIColor clearColor];
    labelCount.textColor = [UIColor whiteColor];
    labelCount.textAlignment = UITextAlignmentCenter;
    labelCount.text = @"99+";
    labelCount.font = [UIFont systemFontOfSize:10];
    [imgMark addSubview:labelCount];
    
    UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(imgCellBg.frame.size.width-50-200, imgMark.frame.origin.y, 200, 15)];
    labelTime.backgroundColor = [UIColor clearColor];
    labelTime.textAlignment = UITextAlignmentRight;
    labelTime.font = [UIFont systemFontOfSize:10];
    labelTime.textColor = [@"#b2b2b2" colorWithHexString];
    labelTime.text = @"10分钟前";
    [imgCellBg addSubview:labelTime];
    
    UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(labelUserName.frame.origin.x, labelUserName.frame.origin.y+labelUserName.frame.size.height+10, imgCellBg.frame.size.width-20-labelUserName.frame.origin.x, 15)];
    labelComment.backgroundColor = [UIColor clearColor];
    labelComment.font = [UIFont systemFontOfSize:13];
    labelComment.text = @"[UIButton buttonWithType:UIButtonTypeCustom];";
    [imgCellBg addSubview:labelComment];
}

@end
