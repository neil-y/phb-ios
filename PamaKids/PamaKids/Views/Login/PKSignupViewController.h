//
//  PKSignupViewController.h
//  PamaKids
//
//  Created by leon on 13-4-28.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"
#import "ApiCmdUser.h"

@interface PKSignupViewController : PKViewController<UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>{
    UITextField *textSelected,*textUserName,*textPassword,*textConfirm,*textNickName;
    UIActionSheet *myActionSheet;
    UIImageView *imgAvatar;
    ApiCmdUser *apiUser;
}

@end
