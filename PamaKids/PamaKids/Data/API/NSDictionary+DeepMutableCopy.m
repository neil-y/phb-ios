//
//  NSDictionary+DeepMutableCopy.m
//  GaoPeng
//
//  Created by zhfish on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "NSDictionary+DeepMutableCopy.h"

@implementation NSDictionary (DeepMutableCopy)
-(NSMutableDictionary *)mutableDeepCopy
{
    NSMutableDictionary *ret = [[NSMutableDictionary alloc] initWithCapacity:[self count]];
    NSArray *keys = [self allKeys];
    for (id key in keys)
    {
        id oneValue = [self valueForKey:key];
        id oneCopy = nil;
        
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue conformsToProtocol:@protocol(NSMutableCopying)])
            oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [ret setObject:oneCopy forKey:key];
    }
    return ret;
}
@end

@implementation NSArray (DeepMutableCopy)
-(NSMutableArray *)mutableDeepCopy
{
    NSMutableArray *ret = [[NSMutableArray alloc] initWithCapacity:[self count]];
    for (id oneValue in self)
    {
        id oneCopy = nil;
        if ([oneValue respondsToSelector:@selector(mutableDeepCopy)])
            oneCopy = [oneValue mutableDeepCopy];
        else if ([oneValue conformsToProtocol:@protocol(NSMutableCopying)])
            oneCopy = [oneValue mutableCopy];
        if (oneCopy == nil)
            oneCopy = [oneValue copy];
        [ret addObject:oneCopy];
    }
    return ret;
}

@end
