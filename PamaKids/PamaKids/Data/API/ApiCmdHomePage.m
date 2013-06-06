//
//  ApiCmdHomePage.m
//  PamaKids
//
//  Created by he chao on 13-5-30.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdHomePage.h"

@implementation ApiCmdHomePage

- (NSMutableDictionary*) getParamDict{
    return nil;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    [super parseResultData:dictionary];
//    if ([delegate respondsToSelector:@selector(parseResultData:)]) {
//        [delegate performSelector:@selector(parseResultData:) withObject:dictionary];
//    }
    NSLog(@"ddd");
}

@end
