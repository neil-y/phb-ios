//
//  PKCardListViewController.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKTableViewController.h"
#import "ApiCmdBabyCard.h"

@interface PKCardListViewController : PKTableViewController{
    ApiCmdBabyCard *apiBabyCard;
    NSMutableDictionary *dictCard;
}

- (void)reloadTableData;

@end
