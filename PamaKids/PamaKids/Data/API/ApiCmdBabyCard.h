//
//  ApiCmdBabyCard.h
//  PamaKids
//
//  Created by he chao on 13-5-30.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "HttpCmdGet.h"

@interface ApiCmdBabyCard : HttpCmdGet

@property (nonatomic,strong) NSString *userid,*cardname;

@end
