//
//  PKConfig.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiClient.h"

@interface PKConfig : NSObject{
}

+ (void) globalInit;
+ (ApiClient*) getApiClient;

@end
