//
//  ApiCmd.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "JSONKit.h"
//#import "GTMBase64.h"
#import "common.h"
#import <CommonCrypto/CommonDigest.h>

#import "ApiLogger.h"
#import "ApiFault.h"
//#import "UIViewCommen.h"
#import "ApiCmd.h"
//#import "GPSessionManager.h"
#import "NSDictionary+DeepMutableCopy.h"

@implementation ApiCmd

@synthesize isFromCache, apiClient, delegate,m_requestUrl;
@synthesize dict,isReturnSuccess;
@synthesize userData, resultData, errorMsg, warnArray,retCode,severtime,isUseEncrypt;
@synthesize DontReadFromCache = _DontReadFromCache;
@synthesize DontWriteToCache = _DontWriteToCache;
- (void) dealloc {
    //	[apiClient release];
    //    [delegate release];
	[userData release];
    [resultData release];
    [dict release];
    [errorMsg release];
    [m_requestUrl release];
	
	[super dealloc];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.apiClient = nil;
        self.delegate = nil;
        self.userData = nil;
        self.dict = nil;
        self.errorMsg = nil;
        self.isFromCache = NO;
        self.isUseEncrypt = NO;
        self.isUseCache = NO;
    }
    
    return self;
}

- (BOOL) hasError {
    if ([retCode intValue] != 0) {
        return YES;
    }
    else{
        return NO;
    }
    
    //    if (nil == errorMsg || [errorMsg length] == 0) {
    //        return NO;
    //    }
    
    
    return YES;
}

- (BOOL) hasWarn {
    if (nil == warnArray) {
        return NO;
    }
    
    return [warnArray count] > 0;
}

- (void) parseJson:(NSData*) data{
    
    if (nil == data) {
        return;
    }
    
    self.dict = nil;
    
    NSString* jsonString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    
    if (nil == jsonString) {
        //apiLogError(@"can not parse NSData to string");
        return;
    }
    
    if ([ApiConfig getApiMessageDebug]) {
        //apiLogInfo(@"Return Json String:\n%@", jsonString);
    }
    
    // parse json data
    NSMutableDictionary* tmpDict = [jsonString mutableObjectFromJSONString];//[[jsonString mutableObjectFromJSONString] mutableDeepCopy];
    if (nil == tmpDict) {
        apiLogError(@"can not parse json string to NSDictionary");
    }
    
    // set the dict value
    self.dict = tmpDict;
    
}

- (void) parseApiError:(NSDictionary*) dictionary {
    if ([dictionary isKindOfClass:[NSArray class]]) {
        return;
    }
    // reset the old state
    isReturnSuccess = [[dictionary valueForKey:@"success"] boolValue];
    return;
    self.errorMsg = nil;
    
    NSString* errorNode = defaultNilObject([dictionary objectForKey:@"retMsg"]);
    NSNumber* time = defaultNilObject([dictionary objectForKey:@"time"]);
    self.severtime = [time doubleValue];
    
    
    
    self.errorMsg =  errorNode;
    self.retCode = [NSString stringWithFormat:@"%@",[dictionary objectForKey:@"retCode"]];
    
}

- (UIViewController*)viewController:(UIView *)vi {
    for (UIView* next = [vi superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void) parseResultData:(NSDictionary*) dictionary{
    // we do nothing here
    // you should override this method in decendent classes
    //    self.resultData = dictionary;
    dictData = dictionary;
    
}

- (void) parseHttpDataAll:(NSData*) data{
    
    // parse json data
    [self parseJson:data];
    
    if (nil == self.dict) {
        return;
    }
    
    // parse api error
    [self parseApiError:self.dict];
    
    //    if (![self hasError]||[self.retCode intValue] == -400006 ||[self.retCode intValue] == -400002) {
    // parse into object data
//    if ([self.dict objectForKey:@"retData"] != nil) {
//        NSMutableDictionary * resData = nil;
//        if(self.isUseEncrypt && [self.dict[@"retData"] isKindOfClass:[NSString class]])
//        {
//        }
//        else
//        {
//            if([[self.dict objectForKey:@"retData"] count]>0)
//                resData = self.dict[@"retData"];
//        }
//        if(self.resultData && [self.resultData count]>0)
//        {
//            [self.resultData removeAllObjects];
//        }
//        self.resultData = [resData mutableDeepCopy];
//        
//        [self parseResultData:resultData];
//    }
    
    if (isReturnSuccess) {
        [self parseResultData:self.dict];
    }
    
    //    }else{
    //
    //        apiLogDebug(@"Api response has error, do not parse result data");
    //    }
}

/**
 *   ASIHttp callback success
 **/
- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    //NSString *responseString = [request responseString];
    
    // Use when fetching binary data
    NSData *responseData = request.responseData;
    self.isFromCache = request.didUseCachedResponse;
    
    [self parseHttpDataAll:responseData];
    
    if (nil != apiClient) {
        // call apiClient first
        [apiClient apiNotifyResult:self error:nil];
    }
    
    if (nil != delegate) {
        // call delegate
        [delegate apiNotifyResult:self error:nil];
    }else{
        [self apiNotifyResult:self error:nil];
    }
    
}

/**
 *  ASIHttp callback fail
 **/
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
    
    self.resultData = nil;
    self.isFromCache = NO;
    
    if (nil != delegate) {
        // call delegate
        [delegate apiNotifyResult:self error:error];
    }else{
        [self apiNotifyResult:self error:error];
    }
}

/**
 *  Implement ApiNotify Protocol
 **/
- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error {
    //apiLogWarn(@"apiNotifyResult called, you should override this method to have your own implementation");
}

- (NSMutableDictionary*) getParamDict{
    return [NSMutableDictionary dictionaryWithCapacity:1];
}

- (NSString*) getCacheKey {
    NSDictionary* paramDict = [self getParamDict];
    NSString *cacheKey = md5([NSString stringWithFormat:@"%@%@?%@",[ApiConfig getApiRequestUrl],self.m_requestUrl,[paramDict JSONString]]);
    
    if (isEmpty(cacheKey)) {
        return nil;
    }
    
    return cacheKey;
}

- (NSString*) getCacheFilePath {
    if (isEmpty([self getCacheKey])) {
        return nil;
    }
    
    return getCacheFilePath([self getCacheKey]);
}

@end