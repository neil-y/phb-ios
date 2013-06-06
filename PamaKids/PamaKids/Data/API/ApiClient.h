//
//  ApiClient.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ApiNotify.h"
#import "ApiCmd.h"
#import "HttpCmdGet.h"

@interface ApiClient : NSObject<ApiNotify>{
    
@private
    NSString* cookie;
}

@property(nonatomic,retain) NSString* cookie;


/**
 *  execute ApiCmd asynchrouse
 **/
- (void) executeApiCmdAsync:(ApiCmd*) cmd;

/**
 *  execute ApiCmd sync
 **/
- (NSError*) executeApiCmd:(ApiCmd*) cmd;


/**
 *  execute HttpCmd asynchrouse
 **/
- (void) executeHttpCmdGetAsync:(HttpCmdGet*) cmd;

/**
 *  execute HttpCmd sync
 **/
- (NSError*) executeHttpCmdGet:(HttpCmdGet*) cmd;

- (void) executeApiCmdAsync:(ApiCmd* )cmd WithBlock:(id)object;
- (void) executeApiCmdGetAsync:(ApiCmd *)cmd WithBlock:(id)object;
- (void) executeApiCmdPutAsync:(ApiCmd *)cmd WithBlock:(id)object;

@end
