//
//  PKLoginViewController.m
//  PamaKids
//
//  Created by leon on 13-4-28.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKLoginViewController.h"
#import "PKSignupViewController.h"
#import "PKPasswordRestoreViewController.h"
#import "PKTestResultViewController.h"
#import "PKCommentListViewController.h"
#import "PKNewsDetailViewController.h"
#import "PKAddTopicViewController.h"
#import "UMSocialSnsPlatformManager.h"
#import "PKHomeViewController.h"
#import "PKMyCollectionViewController.h"
#import "PKAnswerViewController.h"
#import "PKUserViewController.h"
#import "PKMenuViewController.h"
#import "PKSafeRootViewController.h"

@interface PKLoginViewController ()

@end

@implementation PKLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated{
    [textUserName resignFirstResponder];
    [textPassword resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.typeBackground = PKBackgroundTypeMiddle;
    UIImageView *imgBg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imgBg.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:imgBg];
    [self loadContent];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillHideNotification object:nil];
	// Do any additional setup after loading the view.
}


//#define kElementSpaceHeight iPhone5?10:6

- (void)loadContent{
    NSInteger kElementSpaceHeight=iPhone5?13:8;
    
    UIImageView *imgIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_icon"]];
    imgIcon.center = CGPointMake(self.view.frame.size.width/2.0, 15+imgIcon.frame.size.height/2.0);
    UIImageView *imgLiveBook = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"live_book"]];
    imgLiveBook.center = CGPointMake(imgIcon.frame.size.width/2.0, imgIcon.frame.size.height/2.0);
    [imgIcon addSubview:imgLiveBook];
    
    [self.view addSubview:imgIcon];
    if (!iPhone5) {
        imgIcon.transform = CGAffineTransformMakeScale(0.8, 0.8);
        CGRect frame = imgIcon.frame;
        frame.origin.y -= 15;
        imgIcon.frame = frame;
    }
    
    UIImageView *imgLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line1"]];
    imgLine.center = CGPointMake(self.view.frame.size.width/2.0, imgIcon.frame.size.height+imgIcon.frame.origin.y+imgLine.frame.size.height/2.0+10);
    [self.view addSubview:imgLine];
    
    CGFloat y = imgLine.frame.origin.y+10;
    
    UILabel *labelTitle1 = [[UILabel alloc] initWithFrame:CGRectMake(imgLine.frame.origin.x, y, 200, 14)];
    labelTitle1.backgroundColor = [UIColor clearColor];
    labelTitle1.font = [UIFont systemFontOfSize:14];
    labelTitle1.textColor = kLabelColor;
    labelTitle1.text = @"使用新浪微博或腾讯微博账号";
    [self.view addSubview:labelTitle1];
    
    y = y+labelTitle1.frame.size.height+kElementSpaceHeight;
    
    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        [btn setFrame:CGRectMake(imgLine.frame.origin.x+128*i, y, 123, 35)];
        [btn setImage:[UIImage imageNamed:i==0?@"sina_login":@"tencent_login"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickWeiboLogin:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        if (i == 1) {
            y = y+btn.frame.size.height+kElementSpaceHeight;
        }
    }
    
    UILabel *labelTitle2 = [[UILabel alloc] initWithFrame:CGRectMake(imgLine.frame.origin.x, y, 200, 14)];
    labelTitle2.backgroundColor = [UIColor clearColor];
    labelTitle2.font = [UIFont systemFontOfSize:14];
    labelTitle2.textColor = kLabelColor;
    labelTitle2.text = @"或者";
    [self.view addSubview:labelTitle2];
    
    y = y+labelTitle2.frame.size.height+kElementSpaceHeight;
    
    for (int i = 0; i < 2; i++) {
        UIImageView *imgInput = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password_bg"]];
        imgInput.frame = CGRectMake(imgLine.frame.origin.x, y, imgInput.frame.size.width, imgInput.frame.size.height);
        imgInput.userInteractionEnabled = YES;
        [self.view addSubview:imgInput];
        
        UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, imgInput.frame.size.width-10, imgInput.frame.size.height)];
        textfield.delegate = self;
        textfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        textfield.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textfield.font = [UIFont systemFontOfSize:14];
        if (i==0) {
            textUserName = textfield;
            textfield.placeholder = @"用户名";
            textfield.returnKeyType = UIReturnKeyNext;
        }
        else {
            textPassword = textfield;
            textfield.placeholder = @"密码";
            textfield.returnKeyType = UIReturnKeyDone;
            textfield.secureTextEntry = YES;
        }
        
        [imgInput addSubview:textfield];
        
        y = y+imgInput.frame.size.height+kElementSpaceHeight;
    }
    
    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(imgLine.frame.origin.x+128*i, y, 123, 35)];
        [btn setBackgroundImage:[UIImage imageNamed:i==0?@"regist_btn":@"login_btn"] forState:UIControlStateNormal];
        [btn setTitle:i==0?@"账号注册":@"登录" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:i==0?@selector(clickSignupBtn):@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        if (i == 1) {
            y = y+btn.frame.size.height+kElementSpaceHeight;
        }
    }
    
    UIButton *btnForget = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnForget setFrame:CGRectMake(imgLine.frame.origin.x-5, y, 75, 35)];
    [btnForget setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [btnForget setTitleColor:kLabelColor forState:UIControlStateNormal];
    [btnForget addTarget:self action:@selector(clickForgetBtn) forControlEvents:UIControlEventTouchUpInside];
    btnForget.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btnForget];
    
    UIButton *btnJump = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnJump setFrame:CGRectMake(245, y, 60, 35)];
    [btnJump setTitle:@"跳过" forState:UIControlStateNormal];
    [btnJump setTitleColor:kLabelColor forState:UIControlStateNormal];
    [btnJump addTarget:self action:@selector(clickJumpBtn) forControlEvents:UIControlEventTouchUpInside];
    btnJump.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:btnJump];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [textPassword resignFirstResponder];
    [textUserName resignFirstResponder];
}

#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textUserName == textField) {
        [textPassword becomeFirstResponder];
    }
    else {
        [textPassword resignFirstResponder];
    }
    return YES;
}

- (void)keyboardWillChangeFrame:(NSNotification *)notification{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
#endif
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_3_2
        NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey];
#else
        NSValue *keyboardBoundsValue = [[notification userInfo] objectForKey:UIKeyboardBoundsUserInfoKey];
#endif
        CGRect keyboardBounds;
        [keyboardBoundsValue getValue:&keyboardBounds];
        
        BOOL isShowKeyboad = YES;
        
        if (self.view.frame.size.height+20 == keyboardBounds.origin.y) {
            isShowKeyboad = NO;
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            CGRect frame = self.view.frame;
            if (isShowKeyboad) {
                frame.origin.y = -200;
            }
            else {
                frame.origin.y = 0;
            }
            self.view.frame = frame;
        }];

        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    }
#endif   
}

#pragma mark - login/signup
- (void)clickWeiboLogin:(id)sender{
    UMSocialControllerService *_socialUIController = [UMSocialControllerService defaultControllerService];
    _socialUIController.socialUIDelegate = self;
    [_socialUIController.socialDataService setUMSocialDelegate:self];
    NSInteger tag = ((UIButton*)sender).tag;
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:tag==0?@"sina":@"tencent"];
    snsPlatform.loginClickHandler(self,_socialUIController,YES,^(UMSocialResponseEntity *response){
        NSLog(@"response is %@",response);
        NSLog(@"snsType is %@",[[response.data allKeys] objectAtIndex:0]);
    });
    return;
    
    if (((UIButton*)sender).tag == 0) {
        UINavigationController *oauthController = [[UMSocialControllerService defaultControllerService] getSocialOauthController:UMShareToSina];
        [self presentModalViewController:oauthController animated:YES];
        //PKAddTopicViewController *controller = [[PKAddTopicViewController alloc] init];
        //[self.navigationController pushViewController:controller animated:YES];
    }
    else {
        
        
        //UINavigationController *oauthController = [[UMSocialControllerService defaultControllerService] getSocialOauthController:UMShareToTencent];
        //[self presentModalViewController:oauthController animated:YES];
        //PKNewsDetailViewController *controller = [[PKNewsDetailViewController alloc] init];
        //[self.navigationController pushViewController:controller animated:YES];
    }
    //[UMSocialControllerService defaultControllerService].soicalUIDelegate = self;
}

- (void)clickLoginBtn{
    if (apiUser) {
        apiUser = nil;
    }
    apiUser = [[ApiCmdUser alloc] init];
    apiUser.delegate = self;
    apiUser.m_requestUrl = @"/api/users/signin";
    apiUser.password = @"12345678";
    apiUser.username = @"leon2005ccd@126.com";
    
    [[PKConfig getApiClient] executeApiCmdAsync:apiUser WithBlock:self];
    
    [self createATMHud:@"正在登录"];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdUser *result = (ApiCmdUser *)apiCmd;
    if (result.isReturnSuccess) {
        [self hidATMHud];
        [self saveUserData:[result.dict valueForKey:@"user"]];
        [self showMainPage];
    }
    else {
        [self showATMHudError:@"登录失败"];
    }
}

- (void)saveUserData:(NSMutableDictionary *)dict{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"isLogin"];
    id avatar = defaultNilObject([dict valueForKey:@"avatar"]);
    id gender = defaultNilObject([dict valueForKey:@"gender"]);
    id name = defaultNilObject([dict valueForKey:@"name"]);
    id nickname = defaultNilObject([dict valueForKey:@"nickname"]);
    id note = defaultNilObject([dict valueForKey:@"note"]);
    [userDefaults setObject:avatar?avatar:@"" forKey:@"avatar"];
    [userDefaults setObject:[dict valueForKey:@"email"] forKey:@"email"];
    [userDefaults setObject:gender?gender:@"" forKey:@"gender"];
    [userDefaults setObject:[dict valueForKey:@"id"] forKey:@"id"];
    [userDefaults setObject:name?name:@"" forKey:@"name"];
    [userDefaults setObject:nickname?nickname:@"" forKey:@"nickname"];
    [userDefaults setObject:note?note:@"" forKey:@"note"];
}

- (void)showMainPage{
    PKHomeViewController *controller = [[PKHomeViewController alloc] init];
    //[self.navigationController pushViewController:controller animated:YES];
    
    DDMenuController *menuCtrl = [[DDMenuController alloc] initWithRootViewController:controller];
    controller.slideOutCtrl = menuCtrl;
    PKMenuViewController *leftCtrl = [[PKMenuViewController alloc] init];
    menuCtrl.leftViewController = leftCtrl;
    
    PKSafeRootViewController *rightCtrl = [[PKSafeRootViewController alloc] init];
    menuCtrl.rightViewController = rightCtrl;
    
    [self.navigationController pushViewController:menuCtrl animated:YES];
}

- (void)clickSignupBtn{
    PKSignupViewController *controller = [[PKSignupViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)clickForgetBtn{
    PKPasswordRestoreViewController *controller = [[PKPasswordRestoreViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)clickJumpBtn{
    [self showMainPage];
    //PKTestResultViewController *controller = [[PKTestResultViewController alloc] init];
//    PKCommentListViewController *controller = [[PKCommentListViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
