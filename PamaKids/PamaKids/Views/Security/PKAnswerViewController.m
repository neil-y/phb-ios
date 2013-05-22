//
//  PKAnswerViewController.m
//  PamaKids
//
//  Created by leon on 13-5-10.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKAnswerViewController.h"

@interface PKAnswerViewController ()

@end

@implementation PKAnswerViewController

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
    arrayQuestion = [NSArray arrayWithObjects:@"各种坑爹的答案各种坑爹的答案",@"各种坑爹的答案各种坑爹的答案各种坑爹的答案",@"各种坑爹的答案各种坑爹的答案各种坑爹的答案各种坑爹的答案",@"各种坑爹的答案各种坑爹的答案各种坑爹的答案各种坑爹的答案各种坑爹的答案", nil];
    arrayLetters = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F", nil];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];//[UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"安全检测";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self loadContent];
    indexRight = 3;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadContent{
    NSString *strQuestion = @"如果有陌生人打电话找人或者敲门时，家中只有老人和小孩时，怎么应对？";
    UILabel *labelQuestion = [[UILabel alloc] initWithFrame:CGRectMake(18, 80, 320-18*2, 10)];
    labelQuestion.backgroundColor = [UIColor clearColor];
    labelQuestion.text = strQuestion;
    labelQuestion.textColor = [@"#455dd1" colorWithHexString];
    labelQuestion.font = [UIFont systemFontOfSize:16];
    labelQuestion.numberOfLines = 0;
    [self.view addSubview:labelQuestion];
    
    if (!array) {
        array = [[NSMutableArray alloc] initWithCapacity:4];
    }
    else {
        [array removeAllObjects];
    }
    
    CGSize sz = [strQuestion sizeWithFont:labelQuestion.font constrainedToSize:CGSizeMake(labelQuestion.frame.size.width, 200)];
    labelQuestion.frame = CGRectMake(labelQuestion.frame.origin.x,labelQuestion.frame.origin.y,labelQuestion.frame.size.width, sz.height);
    CGFloat y = labelQuestion.frame.origin.y+labelQuestion.frame.size.height+18;
    for (int i = 0; i < arrayQuestion.count; i++) {
        NSString *str = [arrayQuestion objectAtIndex:i];
        CGSize sz2 = [str sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(320-18*2-50-10, 200)];
        UIImageView *imgQuestion = [[UIImageView alloc] initWithFrame:CGRectMake(labelQuestion.frame.origin.x, y, 320-18*2, sz2.height+22)];
        imgQuestion.userInteractionEnabled = YES;
        imgQuestion.image = [[UIImage imageNamed:@"answer_bg"] stretchableImageWithLeftCapWidth:0 topCapHeight:20];
        [self.view addSubview:imgQuestion];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 11, imgQuestion.frame.size.width-50-10, sz2.height)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.text = str;
        label.numberOfLines = 0;
        label.textColor = [@"#333333" colorWithHexString];
        [imgQuestion addSubview:label];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        btn.frame = imgQuestion.bounds;
        [btn addTarget:self action:@selector(checkAnswer:) forControlEvents:UIControlEventTouchUpInside];
        [imgQuestion addSubview:btn];
        
        UILabel *labelMark = [[UILabel alloc] initWithFrame:CGRectMake(7, 8, 30, 30)];
        labelMark.backgroundColor = [UIColor colorWithRed:163/255.0 green:171/255.0 blue:206/255.0 alpha:1];
        labelMark.textColor = [UIColor whiteColor];
        labelMark.font = [UIFont systemFontOfSize:19];
        labelMark.textAlignment = UITextAlignmentCenter;
        labelMark.text = [arrayLetters objectAtIndex:i];
        
        [imgQuestion addSubview:labelMark];
        
        [array addObject:imgQuestion];
        
        y = y+sz2.height+22+7;
    }
    
    btnNext = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNext setFrame:CGRectMake(0, 0, 124, 38)];
    [btnNext setCenter:CGPointMake(160, self.view.frame.size.height-40)];
    [btnNext setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [btnNext setTitle:@"下一题" forState:UIControlStateNormal];
    [btnNext setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnNext.alpha = 0.4;
    btnNext.titleLabel.font = [UIFont systemFontOfSize:14];
    btnNext.userInteractionEnabled = NO;
    [btnNext addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
}

- (void)checkAnswer:(id)sender{
    btnNext.alpha = 1.0;
    btnNext.userInteractionEnabled = YES;
    
    NSInteger index = ((UIButton *)sender).tag;
    UIImageView *imgView = [array objectAtIndex:indexRight];
    UIImageView *imgRight = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 53)];
    imgRight.image = [UIImage imageNamed:@"right"];
    [imgView addSubview:imgRight];
    
    if (index != indexRight) {
        UIImageView *imgView = [array objectAtIndex:index];
        UIImageView *imgWrong = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 53)];
        imgWrong.image = [UIImage imageNamed:@"wrong"];
        [imgView addSubview:imgWrong];
    }
    
    for (int i = 0; i < array.count; i++) {
        ((UIImageView *)[array objectAtIndex:i]).userInteractionEnabled = NO;
    }
}

- (void)clickNextBtn{
}

@end
