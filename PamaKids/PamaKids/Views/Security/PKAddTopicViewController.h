//
//  PKAddTopicViewController.h
//  PamaKids
//
//  Created by leon on 13-5-2.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"
#import "CPTextViewPlaceholder.h"
#import "ApiCmdFeedback.h"

@interface PKAddTopicViewController : PKViewController<UITextViewDelegate>{
    CPTextViewPlaceholder *textTopic,*textContent;
    UILabel *labelTopicCount,*labelContentCount;
    ApiCmdFeedback *apiFeedback;
}

@end
