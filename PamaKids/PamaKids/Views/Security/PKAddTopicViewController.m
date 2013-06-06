//
//  PKAddTopicViewController.m
//  PamaKids
//
//  Created by leon on 13-5-2.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKAddTopicViewController.h"

@interface PKAddTopicViewController ()

@end

@implementation PKAddTopicViewController

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
    [self createNaviBar];
    self.strNaviTitle = @"告诉编辑";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self createNaviBtnRight:[UIImage imageNamed:@"edit_btn"] title:@"发送"];
    
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)clickRightNaviBtn{
    if (textTopic.text.length==0) {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:nil message:@"请输入主题" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [myAlertView show];
        return;
    }
    
    if (textContent.text.length==0) {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:nil message:@"请输入内容" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [myAlertView show];
        return;
    }
    [textContent resignFirstResponder];
    [textTopic resignFirstResponder];
    
    [self createATMHud:@"正在发送"];
    
    if (apiFeedback) {
        apiFeedback = nil;
    }
    apiFeedback = [[ApiCmdFeedback alloc] init];
    apiFeedback.userid = @"1";
    apiFeedback.title = textTopic.text;
    apiFeedback.content = textContent.text;
    apiFeedback.delegate = self;
    apiFeedback.m_requestUrl = @"/api/feedbacks";
    [[PKConfig getApiClient] executeApiCmdAsync:apiFeedback WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdFeedback *result = (ApiCmdFeedback *)apiCmd;
    if (result.isReturnSuccess) {
        [self showATMHudSuccess:@"发送成功"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //[textContent resignFirstResponder];
    //[textTopic resignFirstResponder];
}

- (void)loadContent{
    UIImageView *imgInputBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add_topic_bg"]];
    imgInputBg.center = CGPointMake(self.view.frame.size.width/2.0, imgvNavBar.frame.size.height+5+imgInputBg.frame.size.height/2.0);
    imgInputBg.userInteractionEnabled = YES;
    [self.view addSubview:imgInputBg];
    
    UIImage *img = [UIImage imageNamed:@"input_type2"];
    CGFloat space = (imgInputBg.frame.size.width-img.size.width)/2.0-2;
    for (int i = 0; i < 2; i++) {
        UIImageView *imgInput = [[UIImageView alloc] initWithFrame:CGRectMake(space+2, space+(img.size.height+space)*i, img.size.width, i==0?img.size.height:110)];
        imgInput.userInteractionEnabled = YES;
        imgInput.image = [img stretchableImageWithLeftCapWidth:0 topCapHeight:15];
        
        [imgInputBg addSubview:imgInput];
        
        CPTextViewPlaceholder *textView = [[CPTextViewPlaceholder alloc] initWithFrame:CGRectMake(5, 5, imgInput.frame.size.width-10, imgInput.frame.size.height-10)];
        textView.backgroundColor = [UIColor clearColor];
        textView.delegate = self;
        [imgInput addSubview:textView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgInput.frame.size.width-10-60, imgInput.frame.size.height-10-15, 60, 15)];
        label.textAlignment = UITextAlignmentRight;
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        [imgInput addSubview:label];
        if (i == 0) {
            textTopic = textView;
            textView.placeholder = @"新主题";
            [textView becomeFirstResponder];
            
            label.text = @"0/20";
            labelTopicCount = label;
        }
        else {
            textContent = textView;
            textContent.placeholder = @"内容";
            
            label.text = @"0/140";
            labelContentCount = label;
        }
    }
    
    UIButton *btnSend = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *imgSend = [UIImage imageNamed:@"send_btn"];
    [btnSend setBackgroundImage:imgSend forState:UIControlStateNormal];
    [btnSend setTitle:@"发送" forState:UIControlStateNormal];
    [btnSend setFrame:CGRectMake(0, 0, imgSend.size.width, imgSend.size.height)];
    btnSend.titleLabel.font = [UIFont systemFontOfSize:14];
    [btnSend setCenter:CGPointMake(imgInputBg.frame.size.width/2.0, imgInputBg.frame.size.height-space-imgSend.size.height/2.0)];
    [btnSend addTarget:self action:@selector(clickSendBtn) forControlEvents:UIControlEventTouchUpInside];
    [imgInputBg addSubview:btnSend];
}


- (void)clickSendBtn{
    [self clickRightNaviBtn];
}

#pragma mark - textview delegate
- (void)textViewDidChange:(UITextView *)textView{
    int count = [self countWord:textView.text];
    if (textView == textTopic) {
        labelTopicCount.text = [NSString stringWithFormat:@"%d/20",count];
        if (count>20) {
            labelTopicCount.textColor = [UIColor redColor];
        }
        else{
            labelTopicCount.textColor = [UIColor grayColor];
        }
    }
    else {
        labelContentCount.text = [NSString stringWithFormat:@"%d/140",count];
        if (count>140) {
            labelContentCount.textColor = [UIColor redColor];
        }
        else{
            labelContentCount.textColor = [UIColor grayColor];
        }
    }
    
}

- (int)countWord:(NSString*)s
{
    int i,n=[s length],l=0,a=0,b=0;
    unichar c;
    for(i=0;i<n;i++){
        c=[s characterAtIndex:i];
        if(isblank(c)){
            b++;
        }else if(isascii(c)){
            a++;
        }else{
            l++;
        }
    }
    if(a==0 && l==0) return 0;
    return l+(int)ceilf((float)(a+b)/2.0);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
