//
//  PKMyCollectionCell.m
//  PamaKids
//
//  Created by leon on 13-5-8.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKMyCollectionCell.h"

@implementation PKMyCollectionCell

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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(61, 0, 200, 33)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [@"#333333" colorWithHexString];
    label.text = @"喜羊羊与灰太狼";
    [self.contentView addSubview:label];
    
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(45, 32, self.frame.size.width-45-20, 1)];
    line.image = [UIImage imageNamed:@"my_collection_seperate"];
    [self.contentView addSubview:line];
}

@end
