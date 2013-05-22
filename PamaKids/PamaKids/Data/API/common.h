//
//  common.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSDate* parseDateFromNSNumber(NSNumber* number);

extern BOOL parseBoolFromString(NSString* boolValue);


/**
 *  add a http static prefix path, it the path is not absolute path
 *
 *  such as  /static/img/123.jpg --->  http://staticprefix/static/img/123.jpg
 **/
NSString* prepareStaticHttpPath(NSString* path);


/**
 * extract the file name from path
 *
 **/
NSString* extractFileNameFromPath(NSString* path);

/**
 *  get the Tmp path of download file
 *
 ***/
NSString* getTmpDownloadFilePath(NSString* filePath);

/**
 *  get cache file path
 ***/
NSString* getCacheFilePath(NSString* cacheKey);

/**
 * do md5 hash
 ***/
NSString* md5(NSString* input);

NSString* trimString (NSString* input);

BOOL isNull(id object);

BOOL isEmpty(NSString* str);

id defaultNilObject(id object);

NSString* defaultEmptyString(id object);

BOOL validateEmail(NSString* email);
BOOL validateMobile(NSString* mobile);
