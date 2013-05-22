//
//  ApiLogger.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>

enum ApiLogLevel{
    ApiLogNone = 0,
    ApiLogError,
    ApiLogWarn,
    ApiLogInfo,
    ApiLogDebug,
};


/**
 * get / set the log level
 **/
extern enum ApiLogLevel apiGetLogLevel();
extern void apiSetLogLevel(enum ApiLogLevel level);

/**
 *  log message
 **/
extern void apiLogError(NSString *format,...);
extern void apiLogWarn(NSString *format,...);
extern void apiLogInfo(NSString *format,...);
extern void apiLogDebug(NSString *format,...);
