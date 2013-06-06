//
//  PKCommentListViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-1.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTableViewController.h"
#import "HttpCmdGet.h"

@interface PKCommentListViewController : PKTableViewController{
    HttpCmdGet *apiComments;
    NSDictionary *dictComments;
}

@end
