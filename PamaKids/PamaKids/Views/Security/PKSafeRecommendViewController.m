//
//  PKSafeRecommendViewController.m
//  PamaKids
//
//  Created by leon on 13-5-8.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSafeRecommendViewController.h"

@interface PKSafeRecommendViewController ()

@end

@implementation PKSafeRecommendViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];//[UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"安全推荐";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    /*
    UIImageView *imgPanel1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend_panel1"]];
    UIImageView *imgPanel2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend_panel2"]];
    imgPanel1.frame = CGRectMake((self.view.frame.size.width-imgPanel1.frame.size.width)/2.0, 60, imgPanel1.frame.size.width, imgPanel1.frame.size.height);
    imgPanel2.frame = CGRectMake(imgPanel1.frame.origin.x, imgPanel1.frame.origin.y+imgPanel1.frame.size.height+15, imgPanel1.frame.size.width, imgPanel1.frame.size.height);
    */
    UIImage *imgPanel1 = [UIImage imageNamed:@"recommend_panel1"];
    UIImage *imgPanel2 = [UIImage imageNamed:@"recommend_panel2"];
    for (int i = 0; i < 2; i++) {
        UIImageView *imgPanel = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-imgPanel1.size.width)/2.0, i==0?60:60+imgPanel1.size.height+15, imgPanel1.size.width, i==0?imgPanel1.size.height:imgPanel2.size.height)];
        imgPanel.tag = i;
        imgPanel.userInteractionEnabled = YES;
        imgPanel.image = i==0?imgPanel1:imgPanel2;
        [self.view addSubview:imgPanel];
        
        UILabel *labelTitle1 = [[UILabel alloc] initWithFrame:CGRectMake(13, 15, 200, 18)];
        labelTitle1.backgroundColor = [UIColor clearColor];
        labelTitle1.textColor = [@"#95d4cb" colorWithHexString];
        labelTitle1.font = [UIFont systemFontOfSize:18];
        labelTitle1.text = i==0?@"安全书籍":@"安全电子绘本";
        [imgPanel addSubview:labelTitle1];
        
        UIImageView *imgLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"recommend_line"]];
        imgLine.center = CGPointMake(imgPanel.frame.size.width/2.0, labelTitle1.frame.origin.y+labelTitle1.frame.size.height+2);
        [imgPanel addSubview:imgLine];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"查看全部" forState:UIControlStateNormal];
        [btn setTitleColor:[@"#808080" colorWithHexString] forState:UIControlStateNormal];
        [btn setFrame:CGRectMake(imgLine.frame.origin.x+imgLine.frame.size.width-77, imgLine.frame.origin.y-30, 100, 40)];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickShowAllBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgPanel addSubview:btn];
        
        [self loadBooks:imgPanel];
    }
    
}

- (void)clickShowAllBtn:(id)sender{
    NSLog(@" ");
}

- (void)loadBooks:(UIImageView *)imgVi{
    if (imgVi.tag == 0) {
        for (int i = 0; i < 3; i++) {
            UIImage *bookbg = [UIImage imageNamed:@"recommend_book_bg1"];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(13+(bookbg.size.width+10)*i, 43, bookbg.size.width, bookbg.size.height)];
            [btn setImage:bookbg forState:UIControlStateNormal];
            [imgVi addSubview:btn];
            
            UIImageView *imgBook = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, bookbg.size.width-10, bookbg.size.height-10)];
            imgBook.backgroundColor = [UIColor grayColor];
            [btn addSubview:imgBook];
            
            UILabel *labelBookTitle = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y+btn.frame.size.height+2, btn.frame.size.width, 15)];
            labelBookTitle.backgroundColor = [UIColor clearColor];
            labelBookTitle.font = [UIFont systemFontOfSize:14];
            labelBookTitle.textAlignment = UITextAlignmentCenter;
            labelBookTitle.text = @"一千零一夜";
            [imgVi addSubview:labelBookTitle];
            
            UILabel *labelPrice = [[UILabel alloc] initWithFrame:CGRectMake(labelBookTitle.frame.origin.x, labelBookTitle.frame.origin.y+labelBookTitle.frame.size.height+2, labelBookTitle.frame.size.width, 15)];
            labelPrice.backgroundColor = [UIColor clearColor];
            labelPrice.textColor = [@"#808080" colorWithHexString];
            labelPrice.textAlignment = UITextAlignmentCenter;
            labelPrice.font = [UIFont systemFontOfSize:10];
            labelPrice.text = @"￥100.00";
            [imgVi addSubview:labelPrice];
        }
    }
    else {
        for (int i = 0; i < 4; i++) {
            UIImage *bookbg = [UIImage imageNamed:@"recommend_book_bg2"];
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(13+(bookbg.size.width+10)*i, 43, bookbg.size.width, bookbg.size.height)];
            [btn setImage:bookbg forState:UIControlStateNormal];
            [imgVi addSubview:btn];
            
            UIImageView *imgBook = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, bookbg.size.width-10, bookbg.size.height-10)];
            imgBook.backgroundColor = [UIColor grayColor];
            [btn addSubview:imgBook];
            
            UILabel *labelBookTitle = [[UILabel alloc] initWithFrame:CGRectMake(btn.frame.origin.x, btn.frame.origin.y+btn.frame.size.height+2, btn.frame.size.width, 15)];
            labelBookTitle.backgroundColor = [UIColor clearColor];
            labelBookTitle.font = [UIFont systemFontOfSize:12];
            labelBookTitle.textAlignment = UITextAlignmentCenter;
            labelBookTitle.text = @"一千零一夜";
            [imgVi addSubview:labelBookTitle];
            
            UILabel *labelPrice = [[UILabel alloc] initWithFrame:CGRectMake(labelBookTitle.frame.origin.x, labelBookTitle.frame.origin.y+labelBookTitle.frame.size.height+2, labelBookTitle.frame.size.width, 15)];
            labelPrice.backgroundColor = [UIColor clearColor];
            labelPrice.textColor = [@"#808080" colorWithHexString];
            labelPrice.textAlignment = UITextAlignmentCenter;
            labelPrice.font = [UIFont systemFontOfSize:10];
            labelPrice.text = @"￥100.00";
            [imgVi addSubview:labelPrice];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
