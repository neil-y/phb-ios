//
//  PKSearchViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-6.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSearchViewController.h"
#import "PKSearchResultViewController.h"

@interface PKSearchViewController ()

@end

@implementation PKSearchViewController

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
    
    [self loadKeywords];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    imgInputBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_input_bg"]];
    imgInputBg.center = CGPointMake(self.view.frame.size.width/2.0, imgvNavBar.frame.size.height+5+imgInputBg.frame.size.height/2.0);
    imgInputBg.userInteractionEnabled = YES;
    [self.view addSubview:imgInputBg];
    
    UIImage *img = [UIImage imageNamed:@"input_type2"];
    //CGFloat space = (imgInputBg.frame.size.width-img.size.width)/2.0-2;
    //UIImageView *imgInput = [[UIImageView alloc] initWithFrame:CGRectMake(space+2, space, img.size.width, img.size.height)];
    UIImageView *imgInput = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, img.size.width, img.size.height)];
    imgInput.center = CGPointMake(imgInputBg.frame.size.width/2.0, imgInputBg.frame.size.height/2.0);
    imgInput.userInteractionEnabled = YES;
    imgInput.image = [img stretchableImageWithLeftCapWidth:0 topCapHeight:15];
    [imgInputBg addSubview:imgInput];
    
    myTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 5, imgInput.frame.size.width-15, imgInput.frame.size.height-10)];
    myTextField.placeholder = @"输入搜索关键词";
    myTextField.delegate = self;
    myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    myTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    myTextField.font = [UIFont systemFontOfSize:14];
    myTextField.returnKeyType = UIReturnKeySearch;
    [imgInput addSubview:myTextField];
    
    //[self loadRecommendSearch];
}

- (void)loadKeywords{
    if (apiKeywords) {
        apiKeywords = nil;
    }
    apiKeywords = [[ApiCmdKeywords alloc] init];
    apiKeywords.delegate = self;
    apiKeywords.m_requestUrl = @"/api/search/keywords";
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiKeywords WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdKeywords *result = (ApiCmdKeywords *)apiCmd;
    if (result.isReturnSuccess) {
        dictKeys = (NSMutableDictionary *)result.dict;
        [self loadRecommendSearch];
    }
    
}

- (void)loadRecommendSearch{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgInputBg.frame.origin.x, imgInputBg.frame.size.height+imgInputBg.frame.origin.y+10, 200, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13];
    label.text = @"热门搜索";
    label.textColor = [@"#626262" colorWithHexString];
    [self.view addSubview:label];
    
    UIImage *imgNormal = [UIImage imageNamed:@"recommend_btn_normal"];
    UIImage *imgHighlight = [UIImage imageNamed:@"recommend_btn_highlight"];
    
    NSArray *array = [dictKeys valueForKey:@"keywords"];
    for (int i = 0; i<array.count/2+floor(array.count%2); i++) {
        for (int j = 0; j < 2; j++) {
            if (i*2+j+1>array.count) {
                return;
            }
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:CGRectMake(imgInputBg.frame.origin.x-2+(imgNormal.size.width+2)*i, label.frame.origin.y+label.frame.size.height+5+(imgNormal.size.height+5)*j, imgNormal.size.width, imgNormal.size.height)];
            [btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
            [btn setBackgroundImage:imgHighlight forState:UIControlStateHighlighted];
            NSInteger index = i*2+j;
            btn.tag = index;
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn setTitle:[array objectAtIndex:index] forState:UIControlStateNormal];
            [btn setTitleColor:[@"#95d4cb" colorWithHexString] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:btn];
        }
    }
    
    
//    for (int i = 0; i < 2; i++) {
//        for (int j = 0; j < 2; j++) {
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//            [btn setFrame:CGRectMake(imgInputBg.frame.origin.x-2+(imgNormal.size.width+2)*i, label.frame.origin.y+label.frame.size.height+5+(imgNormal.size.height+5)*j, imgNormal.size.width, imgNormal.size.height)];
//            [btn setBackgroundImage:imgNormal forState:UIControlStateNormal];
//            [btn setBackgroundImage:imgHighlight forState:UIControlStateHighlighted];
//            NSInteger index = i==0?j:2+j;
//            btn.tag = index;
//            btn.titleLabel.font = [UIFont systemFontOfSize:14];
//            [btn setTitle:@"中暑怎么办" forState:UIControlStateNormal];
//            [btn setTitleColor:[@"#95d4cb" colorWithHexString] forState:UIControlStateNormal];
//            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//            [self.view addSubview:btn];
//        }
//    }
}

- (void)clickBtn:(id)sender{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField.text.length == 0) {
        [PKToastView showToast:@"请输入搜索关键字"];
    }
    else {
        PKSearchResultViewController *controller = [[PKSearchResultViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
