//
//  PKCommentCell.m
//  PamaKids
//
//  Created by he chao on 13-5-1.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKCommentCell.h"

@implementation PKCommentCell

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
    
    UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(imgCellBg.frame.size.width-20-200, labelUserName.frame.origin.y, 200, 15)];
    labelTime.backgroundColor = [UIColor clearColor];
    labelTime.textAlignment = UITextAlignmentRight;
    labelTime.font = [UIFont systemFontOfSize:15];
    labelTime.textColor = kLabelColor;
    labelTime.text = @"2013-04-05";
    [imgCellBg addSubview:labelTime];
    
    UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(labelUserName.frame.origin.x, labelUserName.frame.origin.y+labelUserName.frame.size.height+10, imgCellBg.frame.size.width-20-labelUserName.frame.origin.x, 15)];
    labelComment.backgroundColor = [UIColor clearColor];
    labelComment.font = [UIFont systemFontOfSize:13];
    labelComment.text = @"[UIButton buttonWithType:UIButtonTypeCustom];";
    [imgCellBg addSubview:labelComment];
}

@end
