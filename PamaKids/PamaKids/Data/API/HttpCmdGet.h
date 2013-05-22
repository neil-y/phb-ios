//
//  HttpCmdGet.h
//  PamaKids
//
//  Created by he chao on 13-5-16.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "ApiCmd.h"

@interface HttpCmdGet : ApiCmd{
@private
    NSString* requestUri;
    
    //output
    NSString* responseFilePath;
}

@property(nonatomic, retain) NSString* requestUri;
@property(nonatomic, retain) NSString* responseFilePath;

@end