//
//  PKSearchResultViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-6.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSearchResultViewController.h"

@interface PKSearchResultViewController ()

@end

@implementation PKSearchResultViewController
@synthesize strKey;

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
    self.strNaviTitle = @"搜索";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
    strKey = @"AAA";
    [self search];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    imgSearchBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_input_bg"]];
    imgSearchBg.center = CGPointMake(self.view.frame.size.width/2.0, imgvNavBar.frame.size.height+5+imgSearchBg.frame.size.height/2.0);
    imgSearchBg.userInteractionEnabled = YES;
    [self.view addSubview:imgSearchBg];
    
    UIImage *img = [UIImage imageNamed:@"input_type2"];
    CGFloat space = (imgSearchBg.frame.size.width-img.size.width)/2.0-2;
    UIImageView *imgInput = [[UIImageView alloc] initWithFrame:CGRectMake(space+2, space+2, img.size.width, img.size.height)];
    imgInput.userInteractionEnabled = YES;
    imgInput.image = [img stretchableImageWithLeftCapWidth:0 topCapHeight:15];
    [imgSearchBg addSubview:imgInput];
    
    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, imgInput.frame.size.width-15, imgInput.frame.size.height-10)];
    myTextField.placeholder = @"输入搜索关键词";
    myTextField.delegate = self;
    myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    myTextField.font = [UIFont systemFontOfSize:14];
    myTextField.returnKeyType = UIReturnKeySearch;
    [imgInput addSubview:myTextField];
    [self showResultPage];
}

- (void)search{
    if (apiSearch) {
        apiSearch = nil;
    }
    apiSearch = [[HttpCmdGet alloc] init];
    apiSearch.m_requestUrl = [NSString stringWithFormat:@"/api/search?term=%@",strKey];//@"/api/comments?user_id=1";
    apiSearch.delegate = self;
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiSearch WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    HttpCmdGet *result = (HttpCmdGet *)apiCmd;
    if (result.isReturnSuccess) {
        dictSearch = (NSMutableDictionary *)result.dict;
    }
    
    [myTableView reloadData];
}

- (void)showNoResultPage{
    if (!labelNoResult) {
        labelNoResult = [[UILabel alloc] initWithFrame:CGRectMake(0, imgSearchBg.frame.origin.y+imgSearchBg.frame.size.height+13, self.view.frame.size.width, 12)];
        labelNoResult.backgroundColor = [UIColor clearColor];
        labelNoResult.textColor = [@"#b2b2b2" colorWithHexString];
        labelNoResult.textAlignment = UITextAlignmentCenter;
        labelNoResult.text = @"抱歉，没有搜索到相关项目。";
        labelNoResult.font = [UIFont systemFontOfSize:11];
    }
    labelNoResult.hidden = NO;
    [self.view addSubview:labelNoResult];
}

- (void)showResultPage{
    if (!myTableView) {
        [self loadTable];
        [myTableView setFrame:CGRectMake(0, imgSearchBg.frame.origin.y+imgSearchBg.frame.size.height+13, 320, self.view.frame.size.height-(imgSearchBg.frame.origin.y+imgSearchBg.frame.size.height+13))];
    }
    labelNoResult.hidden = YES;
    myTableView.hidden = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
