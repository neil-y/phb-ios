//
//  PKMyTopicViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTableViewController.h"
#import "HttpCmdGet.h"

@interface PKMyTopicViewController : PKTableViewController{
    HttpCmdGet *apiArticles;
    NSDictionary *dictArticles;
}

@end
