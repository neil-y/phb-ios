//
//  PKTopView.h
//  PamaKids
//
//  Created by leon on 13-4-25.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKTopView : UIView

@property (nonatomic, strong) NSDictionary *dictArticle;

- (id)initWithFrame:(CGRect)frame data:(NSDictionary *)dict;
@end
