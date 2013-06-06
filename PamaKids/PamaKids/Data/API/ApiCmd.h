//
//  ApiCmd.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ApiNotify.h"
#import "ApiConfig.h"

@interface ApiCmd : NSObject<ApiNotify>{
    id<ApiNotify> delegate;
     NSDictionary *dictData;
    
@private
    
    BOOL isFromCache;
    
    id<ApiNotify> apiClient;
    
    
    NSDictionary* dict;
    
    NSString* errorMsg;
    BOOL isUseEncrypt;
    NSString* retCode;
    double  severtime;
    NSArray* warnArray;
    
    id userData;
    id resultData;
    NSString* m_requestUrl ; //不是全部，只是后半段
    BOOL isReturnSuccess;
   
}
@property(nonatomic, assign) BOOL isFromCache;
@property(nonatomic, assign) BOOL isUseEncrypt;
@property(nonatomic, assign) BOOL isUseCache;
@property(nonatomic, assign) BOOL DontReadFromCache;
@property(nonatomic, assign) BOOL DontWriteToCache;
@property (nonatomic, assign) BOOL isReturnSuccess;
@property(nonatomic,retain) NSString* m_requestUrl;

@property(nonatomic,assign) id<ApiNotify> apiClient;
@property(nonatomic,assign) id<ApiNotify> delegate;

@property(nonatomic,retain) NSDictionary* dict;

@property(nonatomic,retain) NSString* errorMsg;
@property(nonatomic,retain) NSString* retCode;
@property(nonatomic,assign) double severtime;
@property(nonatomic,retain) NSArray* warnArray;

@property(nonatomic,retain) id userData;
@property(nonatomic,retain) id resultData;


- (BOOL) hasError;
- (BOOL) hasWarn;

/**
 *  for synchrous call
 */
- (void) parseHttpDataAll:(NSData*) data;

/**
 *  parse api error
 **/
- (void) parseApiError:(NSDictionary*) dictionary;

/**
 * parse result data, decendent should override this method
 **/
- (void) parseResultData:(NSDictionary*) dictionary;

/**
 * get all parameters list
 *
 * decendent should override this method
 *
 **/
- (NSMutableDictionary*) getParamDict;

/**
 *  define the cache key for command
 *  we would generate cache key from parameters, if this does not meet your requirement,
 *  you can override this method to define your own key
 **/
- (NSString*) getCacheKey;

/**
 *  cache file path
 ***/
- (NSString*) getCacheFilePath;

@end