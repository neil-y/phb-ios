//
//  ApiCmdUser.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdUser.h"

@implementation ApiCmdUser
@synthesize username,password,nickname;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    if (username) {
        [paramDict setObject:username forKey:@"user[email]"];
    }
    if (password) {
        [paramDict setObject:password forKey:@"user[password]"];
    }
    if (nickname) {
        [paramDict setObject:nickname forKey:@"user[nickname]"];
    }
    
    return paramDict;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    [super parseResultData:dictionary];
    NSLog(@"ddd");
}

@end
