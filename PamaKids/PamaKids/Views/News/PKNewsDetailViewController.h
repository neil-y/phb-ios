//
//  PKNewsDetailViewController.h
//  PamaKids
//
//  Created by leon on 13-5-2.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"

@interface PKNewsDetailViewController : PKViewController<UIWebViewDelegate,UIActionSheetDelegate,UMSocialUIDelegate>{
    UIWebView *myWebView;
    UIActionSheet *myActionSheet;
}

@end
