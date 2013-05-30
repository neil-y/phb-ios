//
//  ApiCmdBabyCard.m
//  PamaKids
//
//  Created by he chao on 13-5-30.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdBabyCard.h"

@implementation ApiCmdBabyCard
@synthesize userid,cardname;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    [paramDict setObject:userid forKey:@"babycard[user_id]"];
    [paramDict setObject:cardname forKey:@"babycard[name]"];
    return paramDict;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    NSLog(@"ddd");
}

@end
