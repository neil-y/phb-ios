//
//  PKCardViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKCardViewController.h"
#import "PKAddCardViewController.h"

@interface PKCardViewController ()

@end

@implementation PKCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iPhone5?@"menu_bg-ip5":@"menu_bg"]];
    [self.view addSubview:img];
    
    [self createNaviBar];
    self.strNaviTitle = @"宝宝安全卡";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self createNaviBtnRight:[UIImage imageNamed:@"edit_btn"] title:@"编辑"];
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    imgCard = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card0"]];
    imgCard.center = CGPointMake(160, 60+imgCard.frame.size.height/2.0);
    [self.view addSubview:imgCard];
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(imgCard.frame.size.width-7-88, 8, 87, 114)];
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgCard addSubview:imgAvatar];
    
    for (int i = 0; i < 8; i++) {
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 77+36*i, 88, 16)];
        lb.textAlignment = UITextAlignmentRight;
        lb.backgroundColor = [UIColor clearColor];
        lb.font = [UIFont systemFontOfSize:15];
        lb.textColor = [@"#808080" colorWithHexString];
        [imgCard addSubview:lb];
        
        UILabel *labelContent = [[UILabel alloc] initWithFrame:CGRectMake(103, 77+36*i, 200, 16)];
        labelContent.backgroundColor = [UIColor clearColor];
        labelContent.font = [UIFont systemFontOfSize:13];
        labelContent.textColor = [@"#333333" colorWithHexString];
        [imgCard addSubview:labelContent];
        
        switch (i) {
            case 0:
            {
                lb.text = @"宝宝姓名";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 1:
            {
                lb.text = @"宝宝性别";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 2:
            {
                lb.text = @"出生日期";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 3:
            {
                lb.text = @"宝宝血型";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 4:
            {
                lb.text = @"爸爸电话";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 5:
            {
                lb.text = @"妈妈电话";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 6:
            {
                lb.text = @"过敏记录";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
            case 7:
            {
                lb.text = @"备注";
                labelContent.text = @"坑爹的宝宝";
            }
                break;
                
            default:
                break;
        }
    }
    
}

- (void)clickRightNaviBtn{
    PKAddCardViewController *controller = [[PKAddCardViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
