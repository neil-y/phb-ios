//
//  PKTopView.m
//  PamaKids
//
//  Created by leon on 13-4-25.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTopView.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "PKHomeViewController.h"
#import "PKNewsDetailViewController.h"

@implementation PKTopView
@synthesize dictArticle;

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)dict
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        dictArticle = dict;
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"frame1"]];
        
        UILabel *labelNote = [[UILabel alloc] initWithFrame:CGRectMake(15, 165, 200, 20)];
        labelNote.backgroundColor = [UIColor clearColor];
        labelNote.font = [UIFont systemFontOfSize:19];
        labelNote.textColor = [kStrOrangeColor colorWithHexString];
        labelNote.text = [dictArticle valueForKey:@"title"];
        [self addSubview:labelNote];
        
        UIImageView *imgCover = [[UIImageView alloc] initWithFrame:CGRectMake(14, 9, 290, 144)];
        NSString *strUrl = [[dictArticle valueForKey:@"cover"] valueForKey:@"url"];//[[[dictArticle valueForKey:@"cover"] objectAtIndex:0] valueForKey:@"url"];
        [imgCover setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",kBaseUrl,strUrl]]];
        [self addSubview:imgCover];
        
        UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(100, labelNote.frame.origin.y, 200, 13)];
        labelTitle.backgroundColor = [UIColor clearColor];
        labelTitle.font = [UIFont systemFontOfSize:12];
        labelTitle.textColor = [kStrTitleColor colorWithHexString];
        labelTitle.text = [dictArticle valueForKey:@"summary"];
        [self addSubview:labelTitle];
        
        UILabel *labelTime = [[UILabel alloc] initWithFrame:CGRectMake(labelTitle.frame.origin.x, labelTitle.frame.origin.y+labelTitle.frame.size.height, 200, 10)];
        labelTime.backgroundColor = [UIColor clearColor];
        labelTime.font = [UIFont systemFontOfSize:7];
        labelTime.textColor = [kStrTitleColor colorWithHexString];
        labelTime.text = [[dictArticle valueForKey:@"created_at"] substringToIndex:10];//@"2013-04-04";
        [self addSubview:labelTime];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = self.bounds;
        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)clickBtn{
    PKNewsDetailViewController *controller = [[PKNewsDetailViewController alloc] init];
    controller.dictArticle = dictArticle;
    
    [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
}

- (DDMenuController *)getMenuCtrl{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).homeController.slideOutCtrl;
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
