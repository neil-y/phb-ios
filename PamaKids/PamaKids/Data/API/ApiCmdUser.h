//
//  ApiCmdUser.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApiCmd.h"

@interface ApiCmdUser : ApiCmd

@property (nonatomic,strong) NSString *username,*password,*nickname;

@end
