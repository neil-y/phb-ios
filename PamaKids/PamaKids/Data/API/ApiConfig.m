//
//  ApiConfig.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiConfig.h"

/**
 *   I use C++ Code here because i want to alloc variables staticly
 *
 */

struct EnvConfig{
    char apiRequestUrl[128];
    char apiStaticUrlPrefix[128];
    char apiAppId[64];
    char apiSignParamKey[128];
    
    // these fields are for alipay
    char alipayPartner[128];
    char alipaySeller[128];
    char alipayNotifyUrl[1024];
    char tenpayNotifyUrl[1024];
    char alipayAppScheme[16];
    char alipayPrivateKey[1024];
    char alipayPublicKey[1024];
    char capses[1024];
    char weixinShareUrl[256];
    char merchantBranch[512];
    char commentsUrl[512];
};

// enviroments
static enum Environment apiEnv = APIDEV;

// enviroments configurations
static struct EnvConfig envConfigArray[APIEND] = {
    
    // APIDEV
    //http://192.168.254.51:31025/api-mobile/
    {
        .apiRequestUrl="m.pamakids.com",
        .apiStaticUrlPrefix="http://cdn.gaopeng.com",
        .apiAppId="123456",
        .apiSignParamKey="111111",
        .capses="http://test.mapi.gaopeng.com/captcha",
        .weixinShareUrl="http://114.251.141.34:8003/deal/share/",
        .merchantBranch="http://114.251.141.34:8011/app/stores",
        .commentsUrl ="http://114.251.141.34:8011/app/comments?grouponId=",
        // these configurations are for alipay
        .alipayPartner="2088201564809153",
        .alipaySeller="2088201564809153",
        .alipayNotifyUrl = "http://dev-api-mobile.gaopeng000.com/alipay",
        .tenpayNotifyUrl="http://qa-api-mobile.gaopeng000.com/tenpay/v2",
        .alipayAppScheme="GaoPeng",
        .alipayPrivateKey="MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAISiSBlMFdjvrMxGboN3/mZ7oRJUQqPVKjPwam4O2DBOO3u3K0VS43ci52uqIvT+sKg48HEeYNufLhmqumyd0UP+n3IRmFxraZmjwKBuvqwjNqkZiuTVGvYDfz3uvjfur2HdOh8vW4ht61NU5+iSb1nRBpOzedjVhEkkCDWlYOZvAgMBAAECgYB34caRNvg4UMo7CR4yrm6/atc3nflt4+p1b8SDHd/CKbQSKolt63G16VKLOgjGsL40DuMlG3QojkQ45twB+NN/9tTP+DFsJ6N+r45U7pvq8FIrV+6ZYgexpnDBPP3aoXv8ne97wsPD9rZVVIvSm8P2m5ZDs/unAhcwsa93FrGwYQJBAMzphED+vrpBftlbeBq9J7lw3X/y5DXMdsIEF/1HC3mAgt1UCE/72HyBiXxEp/shUkOQycfwCTDi8HCQuk2XoLsCQQCls54ivahNME5Kwy2hkWxMDUcSBbu25f/2xkK8Ryt+F32C2IMLJV3+Mg5BQJmr7yHQKoIDvhulQqechsb7BZ/dAkAucYb+TD7ibFHZ5fd06AaG62Poyh6bavpHwzHEwEODiHMgwxkXN9e7cIi+17jTHJxOoBR78pXCtM0WVldDmuhdAkA8Yo+vY2RQ9NijQCuB5KgNsw0CUVqOFZVJDglF6b28zryrkVF4H174gq9VMkCOOrAc11DYIlCa0gaY8TjUQ8F1AkEAuCXyfsxQf9ttar2lCsGzNve8OP+n2vfp0TZDeCt02TZf7O04hC5CNp7JQXJ/wnkzJTmQpPSAjKOojhJpADlpOA==",
        .alipayPublicKey="MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCOq4qN+gmAJRV/vNOt+fXGJ7kRIKXN/lJHbnUj1SHZXlVprw6BAd12sHeRSCclokS0nAL2nRUi/Gji8jUiGw/r3+qStMh5LzstmDlKHqCYuXEkck7Nt5VPrKUlSzdKnTn1NoZ8yKmV4z7rDz+tMGNB4a08av4I76ZwwUDnZGoykwIDAQAB",
    },
    
    // APIQA
    {.apiRequestUrl="http://m.pamakids.com",
        .apiStaticUrlPrefix="http://cdn.gaopeng.com",
        .apiAppId = "GAOPENG_MOBILE_APP_1",
        .apiSignParamKey = "GAOPENGMOBILEVERSION1",
        .capses="http://m.pamakids.com/captcha",
        .weixinShareUrl="http://114.251.141.34/deal/share/",
        .merchantBranch="http://114.251.141.34:8011/app/stores",
        .commentsUrl ="http://114.251.141.34:8011/app/comments?grouponId=",
        // these configurations are for alipay
        .alipayPartner = "2088701556235464",
        .alipaySeller = "2088701556235464",
        .alipayNotifyUrl = "http://qa-api-mobile.gaopeng000.com/alipay/v2",
        .tenpayNotifyUrl = "http://qa-api-mobile.gaopeng000.com/tenpay/v2",
        .alipayAppScheme = "GaoPeng",
        .alipayPrivateKey = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMYmsqVoP7dG3BK+1+EvTHho/AwGn1v5bO0YOA3GU8XRjuHY2pQXYBuMcmKp6hocmvQPU3dsvoHhKi5QDPIbrLRO7BTPMrg9/1EtIZyBGvhIj5JTnuWDyl/vcP097LWj8dTlMJ3zcKaUQEJj1zbZuLph//uNAuKO0/cpEwvOQvphAgMBAAECgYAQNYAtma6Eno5IFkZwjD70JppfnXcRvgCUEIQdVFjr+K14ehW/QX5CIqYEviOBSU+/oTVRspqO401hBnlYoLzqyf9UMnuJluRqqN9PSNd9L2kk0wdsNklK1ycdRWqMRzGoS4JENw88bBYHl1P9zKDmxSqq3xsee4tvwV6FRvYLxQJBAPY7ldbSVMN78HU2Ft8GmEfYmkZst3r/WP1trZRt6ZB6iiMsGuemCFh1wpwwxA4oB7ITWW4tLzXyAPA9smxdyvcCQQDOAtwALD1aCpX/Bk21PTOxhpWscCaZUK4CZOWH+1mH12Te1UxObp/LQ9pligecBKtUgW114zvvTmSWOUOJXvdnAkAllirlQ+4UeRLXkY4kNUmBjhrerTHE4L2g0eExSyXgHBSCEfV5burPNgqi9P64envSPwnju5n9The+lGxsBlU5AkAeP887+0L68Kj7rFpGrXjkrUVW75TLWExkr5oAcIjB6H+4NIuizJ2MBCeSV0UsxIa/vs1qzPXk+pbMdBYVmqsrAkBjmswwEXBhwRDfftqRzyV1HC85800H4XqxVZwR6rcISJ2LkXBoCgVIZgQ8p1CLJ8By+JOEAZ+iI0gVZqL7iuUm",
        .alipayPublicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCMJBjVCICpKE3EvFm1i4spToaeIsa04JswgUn6WUWT/5jLnghCBxIoZcqB60GN/dqBdjf8oWRqj9Ag/9it9XE1E8/xFQLumx72Iz06po8DdcMpw/i4A4MeZADnwD4zlPz4zVey77fgZ6BAdZNEC515h2R/C9kjZcLH4ulakU45iwIDAQAB",
    },
    
    // APILIVE
    {.apiRequestUrl = "http://mapi.gaopeng.com",
        .apiStaticUrlPrefix= "http://cdn.gaopeng.com",
        .apiAppId = "GAOPENG_MOBILE_APP_1",
        .apiSignParamKey = "GAOPENGMOBILEVERSION1",
        .capses="http://mapi.gaopeng.com/captcha",
        .weixinShareUrl="http://w.gaopeng.com/deal/share/",
        .merchantBranch="http://mpapi.gaopeng.com/app/stores",
        .commentsUrl ="http://mpapi.gaopeng.com/app/comments?grouponId=",
        // these configurations are for alipay
        .alipayPartner = "2088701556235464",
        .alipaySeller = "2088701556235464",
        .alipayNotifyUrl = "http://mobile.api.gaopeng.com/alipay/v2",
        .tenpayNotifyUrl = "http://mobile.api.gaopeng.com/tenpay/v2",
        .alipayAppScheme = "GaoPeng",
        .alipayPrivateKey = "MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBAMYmsqVoP7dG3BK+1+EvTHho/AwGn1v5bO0YOA3GU8XRjuHY2pQXYBuMcmKp6hocmvQPU3dsvoHhKi5QDPIbrLRO7BTPMrg9/1EtIZyBGvhIj5JTnuWDyl/vcP097LWj8dTlMJ3zcKaUQEJj1zbZuLph//uNAuKO0/cpEwvOQvphAgMBAAECgYAQNYAtma6Eno5IFkZwjD70JppfnXcRvgCUEIQdVFjr+K14ehW/QX5CIqYEviOBSU+/oTVRspqO401hBnlYoLzqyf9UMnuJluRqqN9PSNd9L2kk0wdsNklK1ycdRWqMRzGoS4JENw88bBYHl1P9zKDmxSqq3xsee4tvwV6FRvYLxQJBAPY7ldbSVMN78HU2Ft8GmEfYmkZst3r/WP1trZRt6ZB6iiMsGuemCFh1wpwwxA4oB7ITWW4tLzXyAPA9smxdyvcCQQDOAtwALD1aCpX/Bk21PTOxhpWscCaZUK4CZOWH+1mH12Te1UxObp/LQ9pligecBKtUgW114zvvTmSWOUOJXvdnAkAllirlQ+4UeRLXkY4kNUmBjhrerTHE4L2g0eExSyXgHBSCEfV5burPNgqi9P64envSPwnju5n9The+lGxsBlU5AkAeP887+0L68Kj7rFpGrXjkrUVW75TLWExkr5oAcIjB6H+4NIuizJ2MBCeSV0UsxIa/vs1qzPXk+pbMdBYVmqsrAkBjmswwEXBhwRDfftqRzyV1HC85800H4XqxVZwR6rcISJ2LkXBoCgVIZgQ8p1CLJ8By+JOEAZ+iI0gVZqL7iuUm",
        .alipayPublicKey = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCMJBjVCICpKE3EvFm1i4spToaeIsa04JswgUn6WUWT/5jLnghCBxIoZcqB60GN/dqBdjf8oWRqj9Ag/9it9XE1E8/xFQLumx72Iz06po8DdcMpw/i4A4MeZADnwD4zlPz4zVey77fgZ6BAdZNEC515h2R/C9kjZcLH4ulakU45iwIDAQAB",
    },
    
};

static const struct EnvConfig* getEnvConfig() {
    
    return &envConfigArray[apiEnv];
}

static const char* getApiRequestUrl() {
    return getEnvConfig()->apiRequestUrl;
}

static const char* getApiStaticUrlPrefix() {
    return getEnvConfig()->apiStaticUrlPrefix;
}

static const char* getApiAppId() {
    return getEnvConfig()->apiAppId;
}

static const char* getApiSignParamKey() {
    return getEnvConfig()->apiSignParamKey;
}

static const char* getAlipayPartner() {
    return getEnvConfig()->alipayPartner;
}

static const char* getCapses() {
    return getEnvConfig()->capses;
}

static const char* getWinxinShareUrl(){
    return getEnvConfig()->weixinShareUrl;
}

static const char* getMerchantBranch(){
    return getEnvConfig()->merchantBranch;
}

static const char* getCommetsUrl(){
    return getEnvConfig()->commentsUrl;
}

static const char* getAlipaySeller() {
    return getEnvConfig()->alipaySeller;
}

static const char* getAlipayNotifyUrl() {
    return getEnvConfig()->alipayNotifyUrl;
}

static const char* getTenpayNotifyUrl() {
    return getEnvConfig()->tenpayNotifyUrl;
}

static const char* getAlipayAppScheme() {
    return getEnvConfig()->alipayAppScheme;
}

static const char* getAlipayPrivateKey() {
    return getEnvConfig()->alipayPrivateKey;
}

static const char* getAlipayPublicKey() {
    return getEnvConfig()->alipayPublicKey;
}

static BOOL apiMessageDebug = YES;

/**
 *  Object C class for other code to use
 *
 */

@implementation ApiConfig

+ (enum Environment) getEnv{
    return apiEnv;
}

+ (void) setEnv:(enum Environment) env{
    apiEnv = env;
}

+ (NSString*) getApiRequestUrl{
    return kBaseUrl;//[NSString stringWithUTF8String:getApiRequestUrl()];
}

+ (NSString*) getApiStaticUrlPrefix{
    return [NSString stringWithUTF8String:getApiStaticUrlPrefix()];
}

+ (NSString*) getApiAppId{
    return [NSString stringWithUTF8String:getApiAppId()];
}

+ (NSString*) getApiSignParamKey{
    return [NSString stringWithUTF8String:getApiSignParamKey()];
}

+ (BOOL) getApiMessageDebug{
    return apiMessageDebug;
}

+ (void) setApiMessageDebug:(BOOL) isDebug{
    apiMessageDebug = isDebug;
}

+ (NSString*) getAlipayPartner{
    return [NSString stringWithUTF8String:getAlipayPartner()];
}

+ (NSString*) getAlipaySeller{
    return [NSString stringWithUTF8String:getAlipaySeller()];
}

+ (NSString*) getAlipayNotifyUrl{
    return [NSString stringWithUTF8String:getAlipayNotifyUrl()];
}

+ (NSString*) getTenpayNotifyUrl{
    return [NSString stringWithUTF8String:getTenpayNotifyUrl()];
}

+ (NSString*) getAlipayAppScheme{
    return [NSString stringWithUTF8String:getAlipayAppScheme()];
}

+ (NSString*) getAlipayPrivateKey{
    return [NSString stringWithUTF8String:getAlipayPrivateKey()];
}

+ (NSString*) getAlipayPublicKey{
    return [NSString stringWithUTF8String:getAlipayPublicKey()];
}

+ (NSString*) getCapses {
    return [NSString stringWithUTF8String:getCapses()];
}

+(NSString*)getWinxinShareUrl{
    return [NSString stringWithUTF8String:getWinxinShareUrl()];
}

+(NSString*)getMerchantBranch{
    return [NSString stringWithUTF8String:getMerchantBranch()];
}

+(NSString*)getCommentUrl{
    return [NSString stringWithUTF8String:getCommetsUrl()];
}

@end