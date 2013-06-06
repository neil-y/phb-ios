//
//  PKNoteView.h
//  PamaKids
//
//  Created by leon on 13-4-24.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKNoteView : UIView
@property (nonatomic, strong) NSDictionary *dictArticle;
- (id)initWithFrame:(CGRect)frame status:(BOOL)isLeft data:(NSDictionary *)dict;
@end
