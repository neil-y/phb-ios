//
//  PKMenuViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-14.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTableViewController.h"
#import "ApiCmdHomePage.h"

@interface PKMenuViewController : PKTableViewController{
    NSInteger selSession,selRow;
    ApiCmdHomePage *apiHomePage;
    NSDictionary *dictCategory;
}

@end
