//
//  ApicCmdComment.m
//  PamaKids
//
//  Created by he chao on 13-6-3.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApicCmdComment.h"

@implementation ApicCmdComment
@synthesize userid,article_id,content,title;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    if (userid) {
        [paramDict setObject:userid forKey:@"comment[user_id]"];
    }
    if (article_id) {
        [paramDict setObject:article_id forKey:@"comment[article_id]"];
    }
    if (content) {
        [paramDict setObject:content forKey:@"comment[content]"];
    }
    if (title) {
        [paramDict setObject:title forKey:@"comment[title]"];
    }
    
    return paramDict;
}

@end
