//
//  PKAnswerViewController.h
//  PamaKids
//
//  Created by leon on 13-5-10.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKViewController.h"

@interface PKAnswerViewController : PKViewController{
    NSArray *arrayQuestion,*arrayLetters;
    NSMutableArray *array;
    NSInteger indexRight;
    UIButton *btnNext;
}

@end
