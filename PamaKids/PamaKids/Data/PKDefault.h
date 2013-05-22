//
//  PKDefault.h
//  PamaKids
//
//  Created by leon on 13-4-25.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#ifndef PamaKids_PKDefault_h
#define PamaKids_PKDefault_h

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define IOS_VER_6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)

#define kStrOrangeColor @"#e3686a"
#define kStrTitleColor @"#1a1a1a"

#define kLabelColor [UIColor colorWithRed:130.0/255 green:130.0/255 blue:130.0/255 alpha:1]

#define kUmengKey @"510aae0652701541ef00000f"

#define kBaseUrl @"http://m.pamakids.com"

#endif
