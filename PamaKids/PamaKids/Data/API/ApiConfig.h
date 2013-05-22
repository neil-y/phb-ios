//
//  ApiConfig.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * @author yuqiang
 *
 * define the enviroment,
 */
enum Environment {APIDEV = 0, APIQA , APILIVE , APIEND};


/**
 *  @author yuqiang
 *
 *  this class should be used as a static configuration,
 *  you should never instantiate it
 *
 */
@interface ApiConfig : NSObject

/**
 * get environment setting
 */
+ (enum Environment) getEnv;

/**
 * set environment
 */
+ (void) setEnv:(enum Environment) env;

/**
 *  get api request url
 */
+ (NSString*) getApiRequestUrl;

+ (NSString*) getApiStaticUrlPrefix;

+ (NSString*) getApiAppId;

+ (NSString*) getApiSignParamKey;

/**
 * whether do api message debug
 */
+ (BOOL) getApiMessageDebug;

+ (void) setApiMessageDebug:(BOOL) isDebug;


/**
 * These configuration is for Alipay
 *
 **/
+ (NSString*) getAlipayPartner;
+ (NSString*) getAlipaySeller;
+ (NSString*) getAlipayNotifyUrl;
+ (NSString*) getTenpayNotifyUrl;
+ (NSString*) getAlipayAppScheme;
+ (NSString*) getAlipayPrivateKey;
+ (NSString*) getAlipayPublicKey;
+(NSString*)getCapses;
+(NSString*)getWinxinShareUrl;
+(NSString*)getMerchantBranch;
+(NSString*)getCommentUrl;

@end




