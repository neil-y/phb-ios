//
//  PKSearchResultViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-6.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKSessionTableViewController.h"

@interface PKSearchResultViewController : PKSessionTableViewController<UITextFieldDelegate>{
    UITextField *myTextField;
    UIImageView *imgSearchBg;
    UILabel *labelNoResult;
}

@end
