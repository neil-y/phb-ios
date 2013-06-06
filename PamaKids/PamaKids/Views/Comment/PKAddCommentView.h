//
//  PKAddCommentView.h
//  PamaKids
//
//  Created by he chao on 13-6-3.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CPTextViewPlaceholder.h"

@interface PKAddCommentView : UIView<UITextViewDelegate>{
    CPTextViewPlaceholder *textView;
}
@property (nonatomic, strong) id mainCtrl;

@end
