//
//  PKCardListCell.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PKCardListViewController;

@interface PKCardListCell : UITableViewCell

@property (nonatomic, strong) PKCardListViewController *mainCtrl;
@property (nonatomic, strong) NSMutableDictionary *dictCard;

@end
