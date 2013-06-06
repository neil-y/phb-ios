//
//  PKSearchViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-6.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"
#import "ApiCmdKeywords.h"

@interface PKSearchViewController : PKViewController<UITextFieldDelegate>{
    UITextField *myTextField;
    UIImageView *imgInputBg;
    ApiCmdKeywords *apiKeywords;
    NSDictionary *dictKeys;
}

@end
