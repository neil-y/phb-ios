//
//  ApiCmdFeedback.m
//  PamaKids
//
//  Created by he chao on 13-6-2.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdFeedback.h"

@implementation ApiCmdFeedback
@synthesize userid,title,content;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    if (userid) {
        [paramDict setObject:userid forKey:@"feedback[user_id]"];
    }
    if (title) {
        [paramDict setObject:title forKey:@"feedback[title]"];
    }
    if (content) {
        [paramDict setObject:content forKey:@"feedback[content]"];
    }
    
    return paramDict;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    [super parseResultData:dictionary];
}

@end
