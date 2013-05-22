//
//  PKNewsInfoCell.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNewsInfoCell.h"

@implementation PKNewsInfoCell

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
    UIImage *cell = [UIImage imageNamed:@"comment_cell_bg"];
    UIImageView *imgCellBg = [[UIImageView alloc] initWithFrame:CGRectMake(9, 2, cell.size.width, 75)];
    imgCellBg.image = [cell stretchableImageWithLeftCapWidth:0 topCapHeight:30];
    //imgCellBg.userInteractionEnabled = YES;
    //imgCellBg.center = CGPointMake(160, imgCellBg.frame.size.height/2.0+3);
    //imgCellBg.center = self.center;
    [self.contentView addSubview:imgCellBg];
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake((imgCellBg.frame.size.height-64)/2.0, (imgCellBg.frame.size.height-64)/2.0, 64, 64)];
    //imgAvatar.layer.cornerRadius = 40.0/2.0;
    imgAvatar.layer.masksToBounds = YES;
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgCellBg addSubview:imgAvatar];
    
    UILabel *labelT = [[UILabel alloc] initWithFrame:CGRectMake(5+2*imgAvatar.frame.origin.x+imgAvatar.frame.size.width, imgAvatar.frame.origin.y+5, 200, 15)];
    labelT.backgroundColor = [UIColor clearColor];
    labelT.font = [UIFont boldSystemFontOfSize:15];
    labelT.text = @"室内安全信息";
    [imgCellBg addSubview:labelT];
    
    UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(imgCellBg.frame.size.width-10-200, labelT.frame.origin.y, 200, 15)];
    labelTime.backgroundColor = [UIColor clearColor];
    labelTime.textAlignment = UITextAlignmentRight;
    labelTime.font = [UIFont systemFontOfSize:10];
    labelTime.textColor = [@"#808080" colorWithHexString];
    labelTime.text = @"2013-04-05";
    [imgCellBg addSubview:labelTime];
    
    UILabel *labelComment = [[UILabel alloc] initWithFrame:CGRectMake(labelT.frame.origin.x, labelT.frame.origin.y+labelT.frame.size.height+12, imgCellBg.frame.size.width-20-labelT.frame.origin.x, 30)];
    labelComment.backgroundColor = [UIColor clearColor];
    labelComment.font = [UIFont systemFontOfSize:13];
    labelComment.text = @"[UIButton buttonWithType:UIButtonTypeCustom];";
    labelComment.numberOfLines = 2;
    [imgCellBg addSubview:labelComment];
}

@end
