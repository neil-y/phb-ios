//
//  ApiCmdBabyCard.m
//  PamaKids
//
//  Created by he chao on 13-5-30.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmdBabyCard.h"

@implementation ApiCmdBabyCard
@synthesize userid,cardname,birthday,blood_type,color,father_phone,gender,mather_phone,note,record;

- (NSMutableDictionary*) getParamDict{
    NSMutableDictionary* paramDict = [[NSMutableDictionary alloc] init];
    if (userid) {
        [paramDict setObject:userid forKey:@"babycard[user_id]"];
    }
    if (cardname) {
        [paramDict setObject:cardname forKey:@"babycard[name]"];
    }
    if (birthday) {
        [paramDict setObject:birthday forKey:@"babycard[birthday]"];
    }
    if (blood_type) {
        [paramDict setObject:blood_type forKey:@"babycard[blood_type]"];
    }
    if (color) {
        [paramDict setObject:color forKey:@"babycard[color]"];
    }
    if (father_phone) {
        [paramDict setObject:father_phone forKey:@"babycard[father_phone]"];
    }
    if (gender) {
        [paramDict setObject:gender forKey:@"babycard[gender]"];
    }
    if (mather_phone) {
        [paramDict setObject:mather_phone forKey:@"babycard[mather_phone]"];
    }
    if (note) {
        [paramDict setObject:note forKey:@"babycard[note]"];
    }
    if (record) {
        [paramDict setObject:record forKey:@"babycard[record]"];
    }
    
    return paramDict;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    [super parseResultData:dictionary];
    NSLog(@"ddd");
}

@end
