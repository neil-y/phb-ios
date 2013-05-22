//
//  ApiLogger.m
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiLogger.h"

static enum ApiLogLevel currentLevel = ApiLogDebug;

enum ApiLogLevel apiGetLogLevel(){
    return currentLevel;
}

void apiSetLogLevel(enum ApiLogLevel level){
    currentLevel = level;
}


void apiLogError(NSString *format,...){
    
    // check level to determine whether we need to log message
    if (currentLevel < ApiLogError) {
        return;
    }
    
    // log message
    va_list argList;
    va_start(argList,format);
    
    NSLogv(format,argList);
    
    va_end(argList);
    
}

void apiLogWarn(NSString *format,...){
    
    // check level to determine whether we need to log message
    if (currentLevel < ApiLogWarn) {
        return;
    }
    
    // log message
    va_list argList;
    va_start(argList,format);
    
    NSLogv(format,argList);
    
    va_end(argList);
    
}

void apiLogInfo(NSString *format,...){
    
    // check level to determine whether we need to log message
    if (currentLevel < ApiLogInfo) {
        return;
    }
    
    // log message
    va_list argList;
    va_start(argList,format);
    
    NSLogv(format,argList);
    
    va_end(argList);
    
}

void apiLogDebug(NSString *format,...){
    
    // check level to determine whether we need to log message
    if (currentLevel < ApiLogDebug) {
        return;
    }
    
    // log message
    va_list argList;
    va_start(argList,format);
    
    NSLogv(format,argList);
    
    va_end(argList);
    
}

