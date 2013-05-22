//
//  PKSignupViewController.m
//  PamaKids
//
//  Created by leon on 13-4-28.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSignupViewController.h"
#import "PKNewsListViewController.h"
#import "PKSafeRecommendViewController.h"

@interface PKSignupViewController ()

@end

@implementation PKSignupViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"账号注册";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillHideNotification object:nil];
	// Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [textPassword resignFirstResponder];
    [textUserName resignFirstResponder];
    [textNickName resignFirstResponder];
    [textConfirm  resignFirstResponder];
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
            if (!isShowKeyboad) {
                frame.origin.y = 0;
            }
            self.view.frame = frame;
        }];
        
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_3_2
    }
#endif
}



- (void)loadContent{
    for (int i = 0; i < 5; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 73+60*i, 100, 15)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = kLabelColor;
        
        UITextField *textField = nil;
        if (i<4) {
            UIImageView *imgInput = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"password_bg"]];
            imgInput.frame = CGRectMake(label.frame.origin.x, label.frame.size.height+label.frame.origin.y+5, imgInput.frame.size.width, imgInput.frame.size.height);
            imgInput.userInteractionEnabled = YES;
            [self.view addSubview:imgInput];
            
            textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, imgInput.frame.size.width-10, imgInput.frame.size.height)];
            textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
            textField.font = [UIFont systemFontOfSize:14];
            textField.delegate = self;
            [imgInput addSubview:textField];
        }
        NSString *strTitle = nil;
        switch (i) {
            case 0:
            {
                strTitle = @"用户名";
                textUserName = textField;
                textUserName.returnKeyType = UIReturnKeyNext;
            }
                break;
            case 1:
            {
                strTitle = @"密码";
                textPassword = textField;
                textPassword.returnKeyType = UIReturnKeyNext;
                textPassword.secureTextEntry = YES;
            }
                break;
            case 2:
            {
                strTitle = @"确认密码";
                textConfirm = textField;
                textPassword.returnKeyType = UIReturnKeyNext;
                textPassword.secureTextEntry = YES;
            }
                break;
            case 3:
            {
                strTitle = @"用户昵称";
                textNickName = textField;
                textNickName.returnKeyType = UIReturnKeyDone;
            }
                break;
            case 4:
            {
                strTitle = @"头像";
            }
                break;
                
            default:
                break;
        }
        label.text = strTitle;
        [self.view addSubview:label];
    }
    
    if (!imgAvatar) {
        imgAvatar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"avatar_default"]];
        imgAvatar.frame = CGRectMake(35, 73+60*4+15+5, imgAvatar.frame.size.width, imgAvatar.frame.size.height);
        [self.view addSubview:imgAvatar];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = imgAvatar.frame;
        [btn addTarget:self action:@selector(clickAvatarBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgAvatar.frame.origin.x+imgAvatar.frame.size.width+10, imgAvatar.frame.origin.y+imgAvatar.frame.size.height-15, 200, 15)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor grayColor];
        label.text = @"(点击添加)";
        [self.view addSubview:label];
    }
    
    for (int i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(35+128*i, imgAvatar.frame.origin.y+imgAvatar.frame.size.height+20, 123, 35)];
        [btn setBackgroundImage:[UIImage imageNamed:i==0?@"regist_btn":@"login_btn"] forState:UIControlStateNormal];
        [btn setTitle:i==0?@"取消":@"注册" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn addTarget:self action:i==0?@selector(clickCancelBtn):@selector(clickSignupBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)clickAvatarBtn{
    [textSelected resignFirstResponder];
    if (!myActionSheet) {
        myActionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择操作" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册选择",@"拍照", nil];
    }
    [myActionSheet showInView:self.view];
}

- (void)clickCancelBtn{
    PKNewsListViewController *controller = [[PKNewsListViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)clickSignupBtn{
    if (apiUser) {
        apiUser = nil;
    }
    apiUser = [[ApiCmdUser alloc] init];
    apiUser.delegate = self;
    apiUser.m_requestUrl = @"/api/users/signup";
    apiUser.password = @"12345678";
    apiUser.username = @"leon2005ccd@126.com";
    
    [[PKConfig getApiClient] executeApiCmdAsync:apiUser WithBlock:self];
    
//    PKSafeRecommendViewController *controller = [[PKSafeRecommendViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:YES];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdUser *result = (ApiCmdUser *)apiCmd;
    if (result.isReturnSuccess) {
        
    }
    NSLog(@"dddd");
}

#pragma mark - action sheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self showPickImageController:NO];
    }
    else if (buttonIndex == 1) {
        [self showPickImageController:YES];
    }
}

- (void)showPickImageController:(BOOL)isCamera{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    picker.allowsEditing = YES;
    if (isCamera) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    [self.navigationController presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo{
    image = [self scaleImage:image];
    imgAvatar.image = image;
    
    [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissModalViewControllerAnimated:YES];
}

#define PHOTO_SIZE 100.0

- (UIImage *)scaleImage:(UIImage *)image

{
    float scaleSize;
    CGSize imgSize = image.size;
    if (imgSize.height>imgSize.width) {
        scaleSize = PHOTO_SIZE/imgSize.width;
    }
    else {
        scaleSize = PHOTO_SIZE/imgSize.height;
    }
	UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

#pragma mark - textfield delegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textUserName == textField) {
        [textPassword becomeFirstResponder];
    }
    else if (textPassword == textField) {
        [textConfirm becomeFirstResponder];
    }
    else if (textConfirm == textField) {
        [textNickName becomeFirstResponder];
    }
    else if (textNickName == textField) {
        [textNickName resignFirstResponder];
    }
    return YES;
}


#pragma mark - textfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textSelected = textField;
    CGRect frame = self.view.frame;
    if (textField == textUserName ||
        textField == textPassword) {
        frame.origin.y = 0;
    }
    else if (textField == textConfirm) {
        frame.origin.y = -100;
    }
    else if (textField == textNickName) {
        frame.origin.y = -150;
    }
    [UIView animateWithDuration:0.25 animations:^{
        self.view.frame = frame;
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
