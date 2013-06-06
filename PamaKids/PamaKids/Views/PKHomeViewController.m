//
//  PKHomeViewController.m
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKHomeViewController.h"
#import "PKSearchViewController.h"
#import "PKMenuViewController.h"
#import "PKSafeRootViewController.h"
#import "PKNoteView.h"
#import "PKTopView.h"
#import "AppDelegate.h"

@interface PKHomeViewController ()

@end

@implementation PKHomeViewController
@synthesize slideOutCtrl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        arrayNormal = [NSArray arrayWithObjects:@"icon-index-normal",@"icon-books-normal",@"icon-blog-normal", nil];
        arrayHighlight = [NSArray arrayWithObjects:@"icon-index-pressed",@"icon-books-pressed",@"icon-blog-pressed", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.typeBackground = PKBackgroundTypeMiddle;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background"]];
    
    UIImageView *imgIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    CGRect frame = imgIcon.frame;
    frame.origin = CGPointMake(18, 15);
    imgIcon.frame = frame;
    [self.view addSubview:imgIcon];
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgSearch = [UIImage imageNamed:@"search"];
    [btnSearch setFrame:CGRectMake(320-imgSearch.size.width-14, 15, imgSearch.size.width, imgSearch.size.height)];
    [btnSearch setImage:imgSearch forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(clickSearchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnSearch];
    
    //[self loadContent];
    [self loadContolBar];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    delegate.homeController = self;
    
    [self loadHomePageData];
	// Do any additional setup after loading the view.
}

- (void)loadHomePageData{
    if (apiHomePage) {
        apiHomePage = nil;
    }
    apiHomePage = [[ApiCmdHomePage alloc] init];
    apiHomePage.m_requestUrl = @"/api/tags/首页";
    apiHomePage.delegate = self;
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiHomePage WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdHomePage *result = (ApiCmdHomePage *)apiCmd;
    if (result.isReturnSuccess) {
        dictCategory = [result.dict valueForKey:@"categories"];
    }
    [self loadContent];
}

- (void)clickBtn{
}

- (void)loadContolBar{
    imgBar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"control bar"]];
    imgBar.frame = CGRectMake(0, self.view.frame.size.height-imgBar.frame.size.height, imgBar.frame.size.width, imgBar.frame.size.height);
    imgBar.userInteractionEnabled = YES;
    [self.view addSubview:imgBar];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(20+120*i, 0, 40, 52)];
        btn.tag = i+100;
        if (i == 0) {
            [btn setImage:[UIImage imageNamed:[arrayHighlight objectAtIndex:i]] forState:UIControlStateNormal];
        }
        else {
            [btn setImage:[UIImage imageNamed:[arrayNormal objectAtIndex:i]] forState:UIControlStateNormal];
        }
        [btn addTarget:self action:@selector(clickTabbarBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgBar addSubview:btn];
    }
}

- (void)loadContent{
    NSArray *arrayKey = [dictCategory allKeys];
    NSArray *arrayArticles = [dictCategory valueForKey:[arrayKey objectAtIndex:0]];
    NSDictionary *dictArticle = [arrayArticles objectAtIndex:0];
    
    PKTopView *topView = [[PKTopView alloc] initWithFrame:CGRectMake(0, 40, 320, 199) data:dictArticle];
    [self.view addSubview:topView];
    for (int i = 0; i < 2; i++) {
        PKNoteView *noteView = [[PKNoteView alloc] initWithFrame:CGRectMake(160*i, 250, 160, 116) status:i==0 data:[arrayArticles objectAtIndex:i+1]];
        [self.view addSubview:noteView];
    }
}

- (void)clickSearchBtn{
    PKSearchViewController *controller = [[PKSearchViewController alloc] init];
    [slideOutCtrl.navigationController pushViewController:controller animated:YES];
}

- (void)clickTabbarBtn:(id)sender{
    NSInteger selTag = ((UIButton *)sender).tag;
    for (int i = 0; i < 3; i++) {
        UIButton *btn = (UIButton *)[imgBar viewWithTag:i+100];
        [btn setImage:[UIImage imageNamed:[arrayNormal objectAtIndex:i]] forState:UIControlStateNormal];
        if (selTag == i+100) {
            [btn setImage:[UIImage imageNamed:[arrayHighlight objectAtIndex:i]] forState:UIControlStateNormal];
        }
        
    }
    switch (selTag) {
        case 100:
        {
            [slideOutCtrl showLeftController:YES];
            //PKMenuViewController *controller = [[PKMenuViewController alloc] init];
            //[self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 102:
        {
            [slideOutCtrl showRightController:YES];
            //PKSafeRootViewController *controller = [[PKSafeRootViewController alloc] init];
            //[slideOutCtrl.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
