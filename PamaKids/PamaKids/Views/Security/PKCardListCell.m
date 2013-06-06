//
//  PKCardListCell.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKCardListCell.h"
#import "PKCardListViewController.h"
#import "PKAddCardViewController.h"

@implementation PKCardListCell
@synthesize mainCtrl,dictCard;

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
    NSArray *arrayColor = @[@"#e7757a",@"#fedf81",@"#84d4fd",@"#bbe9a8",@"#e0b0ee"];
    UIImageView *imgBg = [[UIImageView alloc] initWithFrame:CGRectMake(12, 5, 295, 127)];
    NSString *strColor = defaultNilObject([dictCard valueForKey:@"color"]);
    imgBg.backgroundColor = [[arrayColor objectAtIndex:[strColor integerValue]] colorWithHexString];
    imgBg.userInteractionEnabled = YES;
    imgBg.layer.cornerRadius = 5.0;
    [self.contentView addSubview:imgBg];
    
    UIImageView *imgBg2 = [[UIImageView alloc] initWithFrame:CGRectMake(6, 6, 206, 127-12)];
    imgBg2.backgroundColor = [UIColor whiteColor];
    imgBg2.userInteractionEnabled = YES;
    imgBg2.layer.cornerRadius = 2.0;
    [imgBg addSubview:imgBg2];
    
    for (int i = 0; i < 3; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(36, 12+20*i, 200, 14)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [@"#787878" colorWithHexString];
        label.text = i==0?@"姓名":(i==1?@"性别":@"生日");
        [imgBg2 addSubview:label];
        
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(85, label.frame.origin.y, 200, 14)];
        label2.backgroundColor = [UIColor clearColor];
        label2.font = [UIFont systemFontOfSize:14];
        NSString *strName = defaultNilObject([dictCard objectForKey:@"name"]);
        NSString *strGender = defaultNilObject([dictCard objectForKey:@"gender"]);
        NSString *gender = [strGender integerValue]==0?@"女":@"男";
        NSString *strBirthday = defaultNilObject([dictCard objectForKey:@"birthday"]);
        
        label2.text = i==0?strName:(i==1?gender:strBirthday);
        [imgBg2 addSubview:label2];
    }
    
    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(12+98*i, 77, 86, 26);
        btn.backgroundColor = [UIColor whiteColor];
        btn.layer.cornerRadius = 5.0;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [@"#e9e9e9" colorWithHexString].CGColor;
        [btn setTitle:i==0?@"微博求助":@"一键报警" forState:UIControlStateNormal];
        [btn setTitleColor:[@"#e16f75" colorWithHexString] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgBg2 addSubview:btn];
    }
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(219, 6, 70, 92)];
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgBg addSubview:imgAvatar];
    
    UIButton *btnEdit = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnEdit setFrame:CGRectMake(219, 100, 70, 22)];
    [btnEdit setImage:[UIImage imageNamed:@"card_more"] forState:UIControlStateNormal];
    [btnEdit addTarget:self action:@selector(clickEditBtn) forControlEvents:UIControlEventTouchUpInside];
    [imgBg addSubview:btnEdit];
}

- (void)clickBtn:(id)sender{
}

- (void)clickEditBtn{
    PKAddCardViewController *controller = [[PKAddCardViewController alloc] init];
    controller.isEdit = YES;
    controller.dictCard = dictCard;
    controller.mainCtrl = mainCtrl;
    [mainCtrl.navigationController pushViewController:controller animated:YES];
}

@end
