//
//  NSDictionary+DeepMutableCopy.h
//  GaoPeng
//
//  Created by zhfish on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DeepMutableCopy)
-(NSMutableDictionary *)mutableDeepCopy;

@end

@interface NSArray (DeepMutableCopy)
-(NSMutableArray *)mutableDeepCopy;

@end