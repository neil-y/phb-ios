//
//  ApicCmdComment.h
//  PamaKids
//
//  Created by he chao on 13-6-3.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "HttpCmdGet.h"

@interface ApicCmdComment : HttpCmdGet

@property (nonatomic,strong) NSString *userid,*article_id,*content,*title;

@end
