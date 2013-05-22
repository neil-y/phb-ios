//
//  PKNewsCell.m
//  PamaKids
//
//  Created by he chao on 13-5-4.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNewsCell.h"

@implementation PKNewsCell

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
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake((imgCellBg.frame.size.height-50)/2.0, (imgCellBg.frame.size.height-50)/2.0, 50, 50)];
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgCellBg addSubview:imgAvatar];
    
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(2*imgAvatar.frame.origin.x+imgAvatar.frame.size.width, imgAvatar.frame.origin.y, 200, 15)];
    labelTitle.backgroundColor = [UIColor clearColor];
    labelTitle.font = [UIFont boldSystemFontOfSize:15];
    labelTitle.text = @"坑爹";
    [imgCellBg addSubview:labelTitle];
    
//    UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(imgCellBg.frame.size.width-20-200, labelUserName.frame.origin.y, 200, 15)];
//    labelTime.backgroundColor = [UIColor clearColor];
//    labelTime.textAlignment = UITextAlignmentRight;
//    labelTime.font = [UIFont systemFontOfSize:15];
//    labelTime.textColor = kLabelColor;
//    labelTime.text = @"2013-04-05";
//    [imgCellBg addSubview:labelTime];
    
    UILabel *labelDescription = [[UILabel alloc] initWithFrame:CGRectMake(labelTitle.frame.origin.x, labelTitle.frame.origin.y+labelTitle.frame.size.height+5, imgCellBg.frame.size.width-10-labelTitle.frame.origin.x, 30)];
    labelDescription.backgroundColor = [UIColor clearColor];
    labelDescription.font = [UIFont systemFontOfSize:13];
    labelDescription.textColor = [UIColor colorWithRed:72.0/255 green:72.0/255 blue:72.0/255 alpha:1];
    labelDescription.numberOfLines = 2;
    labelDescription.text = @"主人说，小狗Bella和海狸Beavis每天会一起玩球，连吃饭都腻在";
    [imgCellBg addSubview:labelDescription];
    
    UILabel *labelFollow = [[UILabel alloc] initWithFrame:CGRectMake(labelDescription.frame.origin.x+labelDescription.frame.size.width-200, labelDescription.frame.origin.y+labelDescription.frame.size.height-14, 200, 15)];
    labelFollow.textColor = [UIColor colorWithRed:163.0/255 green:209.0/255 blue:202.0/255 alpha:1];
    labelFollow.backgroundColor = [UIColor clearColor];
    labelFollow.font = [UIFont systemFontOfSize:11];
    labelFollow.textAlignment = UITextAlignmentRight;
    labelFollow.text = @"9527跟帖";
    [imgCellBg addSubview:labelFollow];
}

@end
