//
//  PKAddCardViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"

@interface PKAddCardViewController : PKViewController<UITextFieldDelegate,UIScrollViewDelegate>{
    UIScrollView *myScrollView;
    UITextField *textName,*textBirthday,*textFaNum,*textMoMun,*textRecord,*textNotice,*textSelected;
    UIImageView *imgCard;
    NSMutableArray *arrayGender,*arrayBlood;
}

@end
