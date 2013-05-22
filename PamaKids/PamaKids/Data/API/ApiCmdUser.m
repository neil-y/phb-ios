//
//  ApiCmdUser.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdUser.h"

@implementation ApiCmdUser
@synthesize username,password;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    [paramDict setObject:username forKey:@"user[email]"];
    [paramDict setObject:password forKey:@"user[password]"];
    return paramDict;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    NSLog(@"ddd");
}

@end
