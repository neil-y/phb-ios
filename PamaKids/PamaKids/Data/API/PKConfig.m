//
//  PKConfig.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKConfig.h"
#import "common.h"
#import "PKConfig.h"

@implementation PKConfig

static ApiClient* apiClient =  nil;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (void) globalInit {
    
    // configure api-mobile module
    // we configure it to be Debug mode for development
    // but we need to change to Prod mode when do deploy
    
    //    [ApiConfig setEnv:APIQA];
    NSString *versionStr = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    
    if([versionStr isEqualToString:@"高朋测试"])
    {
        [ApiConfig setEnv:APIDEV];
        [ApiConfig setApiMessageDebug:YES];
        
    }
    else
    {
        [ApiConfig setEnv:APILIVE];
        [ApiConfig setApiMessageDebug:YES];
        
    }
    //    apiSetLogLevel(ApiLogWarn);
    
    if (nil == apiClient) {
        apiClient = [[ApiClient alloc] init];
        
        // for debugging purpose, so there is no need to login for testing
        // functions including MyAccount/MyOrder
        //apiClient.cookie = @"{\"userId\":\"1449220088\"}";
    }
}

+ (ApiClient*) getApiClient {
    if (nil == apiClient) {
        apiClient = [[ApiClient alloc] init];
        
        // for debugging purpose, so there is no need to login for testing
        // functions including MyAccount/MyOrder
        //apiClient.cookie = @"{\"userId\":\"1449220088\"}";
    }
    return apiClient;
}

@end
