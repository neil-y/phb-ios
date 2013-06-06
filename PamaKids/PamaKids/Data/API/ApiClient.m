//
//  ApiClient.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ASIFormDataRequest.h"

#import "ApiConfig.h"
#import "ApiLogger.h"

#import "ApiClient.h"
#import "common.h"
#import "ASIDownloadCache.h"

// const static key
static NSString* keyCookie = @"cookie";

@implementation ApiClient

// define getter/setter methods
@synthesize cookie;

/**
 *  do init work
 */
- (id)init
{
    self = [super init];
    if (self) {
        // set an empty cookie, so we would not met any null pointer
        
//        NSString * scookie = getValueFromKey(@"cookie");
//        if (cookie != nil && [cookie length] > 0) {
//            cookie = scookie;
//        }
//        else{
//            cookie = @"";
//        }
        
    }
    
    return self;
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error {
    // update cookie here
    ApiCmd* cmd = (ApiCmd*)apiCmd;
    
    NSString* newCookie = [cmd.dict objectForKey:keyCookie];
    
    if (nil != newCookie) {
        self.cookie = newCookie;
    }
}

/**
 *  do signature of all parametrs
 */
- (NSString*) signParam:(NSMutableDictionary*) dict{
    
    // add all keys into array
    NSMutableArray* paramArray = [[NSMutableArray alloc] initWithCapacity:[dict count]];
    
    NSEnumerator *enumerator = [dict keyEnumerator];
    NSString* key;
    
    while ((key = [enumerator nextObject])) {
        [paramArray addObject:key];
    }
    
    // sort the param array
    [paramArray sortUsingComparator:^(id obj1, id obj2){
        NSString* str1 = obj1;
        NSString* str2 = obj2;
        return [str1 compare:str2];
    }];
    
    // append the values to form the pre-encryption string
    NSMutableString* mutableString = [[NSMutableString alloc] initWithCapacity:128];
    for (NSInteger index = 0; index < [paramArray count]; index++) {
        id tmpId = [dict objectForKey:[paramArray objectAtIndex:index]];
        
        NSString* strValue =  @"";
        
        if ([tmpId isKindOfClass:[NSString class]]) {
            strValue = tmpId;
        }else if([tmpId isKindOfClass:[NSNumber class]]){
            strValue = [tmpId stringValue];
        }else{
            // do nothing
            //apiLogError(@"Error Value of [%@], can only accept NSString or NSNumber",[paramArray objectAtIndex:index]);
        }
        
        [mutableString appendString:strValue];
    }
    
    // append the apiSignParamKey
    [mutableString appendString:[ApiConfig getApiSignParamKey]];
    
    // do MD5 encryption
    return md5(mutableString);
}

- (ASIFormDataRequest*) prepareExecuteApiCmd:(ApiCmd*) cmd{
    
    // set apiClient of cmd
    cmd.apiClient = self;
    
    // prepare post data
    NSDictionary* postDict = [cmd getParamDict];
    
    // add appId & cookie & phoneType
    
    //postDict = [[GPSessionManager sharedInstance] encodeWithParams:postDict useEncrypt:cmd.isUseEncrypt];
    
    // add all parameters to post data
    
    // prepare http request
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",[ApiConfig getApiRequestUrl],cmd.m_requestUrl]];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    if ([ApiConfig getApiMessageDebug])
        apiLogInfo(@"requestURL=%@", url);
    
    NSEnumerator *enumerator = [postDict keyEnumerator];
    id key;
    while ((key = [enumerator nextObject])) {
        NSString* value = (NSString*)[postDict objectForKey:key];
        // set post data
        [request setPostValue:value forKey:(NSString*)key];
        // for debugging purpose
        if ([ApiConfig getApiMessageDebug]) {
            apiLogInfo(@"Post Param : Key [%@] Value [%@]", (NSString*)key, value);
        }
    }
    if(cmd.isUseCache)
    {
        ASICachePolicy policy = ASIFallbackToCacheIfLoadFailsCachePolicy;
        if (cmd.DontWriteToCache) {
            policy |= ASIDoNotWriteToCacheCachePolicy;
        }
        if (cmd.DontReadFromCache) {
            policy |= ASIDoNotReadFromCacheCachePolicy;
        }
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCachePolicy:policy];
        [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    }
    
    
    return request;
}

- (void) executeApiCmdAsync:(ApiCmd*) cmd{
    
    ASIFormDataRequest* request = [self prepareExecuteApiCmd:cmd];
    [request setDelegate:cmd];
    [request startAsynchronous];
}

- (void) executeApiCmdAsync:(ApiCmd*) cmd WithBlock:(id)object{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //[object retain];
        [self executeApiCmd:cmd];
        //[object release];
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
}

- (void) executeApiCmdGetAsync:(HttpCmdGet*) cmd WithBlock:(id)object{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //[object retain];
        [self executeHttpCmdGet:cmd];
        //[object release];
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
}

- (void) executeApiCmdPutAsync:(ApiCmd *)cmd WithBlock:(id)object{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        //[object retain];
        [self executeApiPutCmd:cmd];
        //[object release];
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
        
    });
}

- (NSError*) executeApiCmd:(ApiCmd*) cmd{
    ASIFormDataRequest* request = [self prepareExecuteApiCmd:cmd];
    [request startSynchronous];
    NSError *error = [request error];
    NSData *responseData = request.responseData;
    int statusCode = [request responseStatusCode];
    cmd.isFromCache = NO;
    if (statusCode == 200||statusCode == 201) {
        cmd.isFromCache = request.didUseCachedResponse;
        NSString* str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        [cmd parseHttpDataAll:responseData];
    }
    else {
        NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    }
    
    
    [self apiNotifyResult:cmd error:error];
    if (cmd.delegate && [cmd.delegate respondsToSelector:@selector(apiNotifyResult:error:)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cmd.delegate apiNotifyResult:cmd error:error];
        });
        
    }
    cmd.isFromCache = request.didUseCachedResponse;
    
    return error;
}

- (NSError*) executeApiPutCmd:(ApiCmd*) cmd{
    ASIFormDataRequest* request = [self prepareExecuteApiCmd:cmd];
    [request setRequestMethod:@"PUT"];
    [request startSynchronous];
    NSError *error = [request error];
    NSData *responseData = request.responseData;
    int statusCode = [request responseStatusCode];
    cmd.isFromCache = NO;
    if (statusCode == 200||statusCode == 201) {
        cmd.isFromCache = request.didUseCachedResponse;
        NSString* str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
        [cmd parseHttpDataAll:responseData];
    }
    else {
        NSString *str = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",str);
    }
    
    
    [self apiNotifyResult:cmd error:error];
    if (cmd.delegate && [cmd.delegate respondsToSelector:@selector(apiNotifyResult:error:)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cmd.delegate apiNotifyResult:cmd error:error];
        });
        
    }
    cmd.isFromCache = request.didUseCachedResponse;
    
    return error;
}


- (ASIHTTPRequest*) prepareExecuteHttpCmdGet:(HttpCmdGet*) cmd {
    
    // prepare http request
    //NSURL *url = [NSURL URLWithString:prepareStaticHttpPath(cmd.requestUri)];
    NSString *str = [[NSString stringWithFormat:@"%@%@",[ApiConfig getApiRequestUrl],cmd.m_requestUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSURL *url = [NSURL URLWithString:str];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    //[request setRequestMethod:@"PUT"];
    
    if(cmd.isUseCache)
    {
        ASICachePolicy policy = ASIFallbackToCacheIfLoadFailsCachePolicy;
        if (cmd.DontWriteToCache) {
            policy |= ASIDoNotWriteToCacheCachePolicy;
        }
        if (cmd.DontReadFromCache) {
            policy |= ASIDoNotReadFromCacheCachePolicy;
        }
        [request setDownloadCache:[ASIDownloadCache sharedCache]];
        [request setCachePolicy:policy];
        [request setCacheStoragePolicy:ASICachePermanentlyCacheStoragePolicy];
    }
    
    if ([ApiConfig getApiMessageDebug]) {
        //apiLogError(@"Request File : [%@]", prepareStaticHttpPath(cmd.requestUri));
        //apiLogDebug(@"DowladFilePath : [%@]", cmd.responseFilePath);
    }
    
    return request;
}

/**
 *  execute HttpCmd asynchrouse
 **/
- (void) executeHttpCmdGetAsync:(HttpCmdGet*) cmd {
    ASIHTTPRequest* request = [self prepareExecuteHttpCmdGet:cmd];
    [request setDelegate:cmd];
    [request startAsynchronous];
}

/**
 *  execute HttpCmd sync
 **/
- (NSError*) executeHttpCmdGet:(HttpCmdGet*) cmd {
    
    ASIHTTPRequest* request = [self prepareExecuteHttpCmdGet:cmd];
    [request startSynchronous];
    
    NSError *error = [request error];
    int statusCode = [request responseStatusCode];
    if (statusCode == 200) {
        NSData *responseData = request.responseData;
        [cmd parseHttpDataAll:responseData];
        [self apiNotifyResult:cmd error:error];
        cmd.isFromCache = request.didUseCachedResponse;
    }else
    {
        [self apiNotifyResult:cmd error:error];
        cmd.isFromCache = NO;
        
    }
    if (cmd.delegate && [cmd.delegate respondsToSelector:@selector(apiNotifyResult:error:)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [cmd.delegate apiNotifyResult:cmd error:error];
        });
        
    }
    
    return error;
}


@end
