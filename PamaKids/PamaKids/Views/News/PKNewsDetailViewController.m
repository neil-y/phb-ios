//
//  PKNewsDetailViewController.m
//  PamaKids
//
//  Created by leon on 13-5-2.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKNewsDetailViewController.h"
#import "UMSocialSnsPlatformManager.h"
#import "PKAddCommentView.h"

@interface PKNewsDetailViewController ()

@end

@implementation PKNewsDetailViewController
@synthesize dictArticle;

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"page_bg":@"page_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"新闻信息";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self performSelector:@selector(loadContent) withObject:nil afterDelay:0.5];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    if (!myWebView) {
        myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50)];
        myWebView.delegate = self;
    }
    [myWebView loadHTMLString:[dictArticle valueForKey:@"content"] baseURL:nil];
    //[myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[dictArticle valueForKey:@"content"]]]];
    [self.view addSubview:myWebView];
    
    UIImageView *imgToolbar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"news_detail_mark"]];
    CGRect frame = imgToolbar.frame;
    frame.origin = CGPointMake(self.view.frame.size.width-5-imgToolbar.frame.size.width, self.view.frame.size.height-20-imgToolbar.frame.size.height);
    imgToolbar.frame = frame;
    imgToolbar.userInteractionEnabled = YES;
    [self.view addSubview:imgToolbar];
    
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(16+60*i, 0, 24, imgToolbar.frame.size.height)];
        [btn setImage:[UIImage imageNamed:i==0?@"detail_share":(i==1?@"detail_comment":@"detail_like")] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickToolbarBtn:) forControlEvents:UIControlEventTouchUpInside];
        [imgToolbar addSubview:btn];
    }
}

- (void)clickToolbarBtn:(id)sender{
    switch (((UIButton *)sender).tag) {
        case 0:
        {
            if (!myActionSheet) {
                myActionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择操作" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"分享到新浪微博",@"分享到腾讯微博", nil];
            }
            [myActionSheet showInView:self.view];
        }
            break;
        case 1:
        {
            PKAddCommentView *commentView = [[PKAddCommentView alloc] initWithFrame:self.view.bounds];
            commentView.mainCtrl = self;
            [self.view addSubview:commentView];
            [commentView performSelector:@selector(loadContent)];
        }
            break;
        case 2:
        {
            
        }
            break;
            
        default:
            break;
    }
}

- (void)sendComment:(NSString *)strContent{
    if (apiComment) {
        apiComment = nil;
    }
    apiComment = [[ApicCmdComment alloc] init];
    apiComment.m_requestUrl = @"/api/comments";
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    apiComment.userid = [userDefaults valueForKey:@"id"];
    apiComment.content = strContent;
    apiComment.article_id = [dictArticle valueForKey:@"id"];
    
    apiComment.delegate = self;
    [[PKConfig getApiClient] executeApiCmdAsync:apiComment WithBlock:self];//executeApiCmdGetAsync:apiComment WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApicCmdComment *result = (ApicCmdComment *)apiCmd;
    if (result.isReturnSuccess) {
        dictResult = (NSMutableDictionary *)result.dict;
    }
    
    //[myTableView reloadData];
}

#pragma mark - action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex<2) {
        UMSocialControllerService *controller = [[UMSocialControllerService alloc] init];
        controller.socialUIDelegate = self;
        controller.socialData.shareImage = [UIImage imageNamed:@"avatar.jpg"];
        controller.socialData.shareText = @"kkkksssskksksks";
        
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:buttonIndex==0?@"sina":@"tencent"];
        
        snsPlatform.snsClickHandler(self,controller,YES);
    }
//    if (buttonIndex == 0) {
//        //[UMSocialSnsService presentSnsController:self appKey:kUmengKey shareText:@"alkjfklsjdkl" shareImage:nil shareToSnsNames:nil delegate:nil];
//        
//    }
//    else if (buttonIndex == 1) {
//        
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
