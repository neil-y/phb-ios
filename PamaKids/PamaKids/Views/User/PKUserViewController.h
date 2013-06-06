//
//  PKUserViewController.h
//  PamaKids
//
//  Created by leon on 13-5-10.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"
#import "ApiCmdUser.h"

@interface PKUserViewController : PKViewController<UITextFieldDelegate>{
    UITextField *textUserName,*textNickname,*textGender;
    ApiCmdUser *apiUser;
}

@end
