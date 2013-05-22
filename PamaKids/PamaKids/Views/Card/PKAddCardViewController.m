//
//  PKAddCardViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKAddCardViewController.h"

@interface PKAddCardViewController ()

@end

@implementation PKAddCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iPhone5?@"menu_bg-ip5":@"menu_bg"]];
    [self.view addSubview:img];
    
    arrayGender = [[NSMutableArray alloc] initWithCapacity:2];
    arrayBlood = [[NSMutableArray alloc] initWithCapacity:4];
    
    [self createNaviBar];
    self.strNaviTitle = @"宝宝安全卡";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    [self createNaviBtnRight:[UIImage imageNamed:@"edit_btn"] title:@"保存"];
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)loadContent{
    myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 44, 320, self.view.frame.size.height-44)];
    myScrollView.delegate = self;
    [self.view addSubview:myScrollView];
    
    imgCard = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_edit0"]];
    imgCard.frame = CGRectMake((self.view.frame.size.width-imgCard.frame.size.width)/2.0, 20, imgCard.frame.size.width, imgCard.frame.size.height);
    imgCard.userInteractionEnabled = YES;
    [myScrollView addSubview:imgCard];
    myScrollView.contentSize = CGSizeMake(320, imgCard.frame.origin.y+imgCard.frame.size.height+10);
    
    UIImageView *imgAvatar = [[UIImageView alloc] initWithFrame:CGRectMake(103, 7, 87, 114)];
    imgAvatar.image = [UIImage imageNamed:@"avatar.jpg"];
    [imgCard addSubview:imgAvatar];
    
    UILabel *labelNote = [[UILabel alloc] initWithFrame:CGRectMake(0, 142, imgCard.frame.size.width, 11)];
    labelNote.backgroundColor = [UIColor clearColor];
    labelNote.textAlignment = UITextAlignmentCenter;
    labelNote.textColor = [@"#808080" colorWithHexString];
    labelNote.text = @"请正确填写信息,以建立准备的儿童安全卡!";
    labelNote.font = [UIFont systemFontOfSize:10];
    [imgCard addSubview:labelNote];
    
    for (int i = 0; i < 9; i++) {
        UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, labelNote.frame.origin.y+labelNote.frame.size.height+13+36*i+(i>=4?20:0), 77, 16)];
        lb.textAlignment = UITextAlignmentRight;
        lb.backgroundColor = [UIColor clearColor];
        lb.font = [UIFont systemFontOfSize:15];
        lb.textColor = [@"#808080" colorWithHexString];
        [imgCard addSubview:lb];
        
        switch (i) {
            case 0:
            {
                lb.text = @"宝宝姓名";
                UIImageView *imgInput = [self createInputImage];
                textName = [self createInputText:imgInput];
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
            }
                break;
            case 1:
            {
                lb.text = @"宝宝性别";
                [arrayGender removeAllObjects];
                for (int i = 0; i < 2; i++) {
                    UIView *vi = [self createSingleCheckBtn:i==0?YES:NO title:i==0?@"男孩":@"女孩" tag:i];
                    CGRect frame = vi.frame;
                    frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14+84*i, lb.frame.origin.y+3);
                    vi.frame = frame;
                    [imgCard addSubview:vi];
                    [arrayGender addObject:vi];
                }
            }
                break;
            case 2:
            {
                lb.text = @"出生日期";
                UIImageView *imgInput = [self createInputImage];
                textBirthday = [self createInputText:imgInput];
                textBirthday.userInteractionEnabled = NO;
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
                
            }
                break;
            case 3:
            {
                lb.text = @"宝宝血型";
                [arrayBlood removeAllObjects];
                for (int i = 0; i < 2; i++) {
                    for (int j = 0; j < 2; j++) {
                        NSInteger index = (i==0?j:2+j);
                        NSString *str = nil;
                        if (index == 0) {
                            str = @"A型";
                        }
                        else if (index == 1){
                            str = @"B型";
                        }
                        else if (index == 2){
                            str = @"O型";
                        }
                        else {
                            str = @"AB型";
                        }
                        UIView *vi = [self createSingleCheckBtn:index==0?YES:NO title:str tag:index+100];
                        CGRect frame = vi.frame;
                        frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14+84*i, lb.frame.origin.y+3+j*22);
                        vi.frame = frame;
                        [imgCard addSubview:vi];
                        [arrayBlood addObject:vi];
                    }
                }
            }
                break;
            case 4:
            {
                lb.text = @"爸爸电话";
                UIImageView *imgInput = [self createInputImage];
                textFaNum = [self createInputText:imgInput];
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
            }
                break;
            case 5:
            {
                lb.text = @"妈妈电话";
                UIImageView *imgInput = [self createInputImage];
                textMoMun = [self createInputText:imgInput];
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
            }
                break;
            case 6:
            {
                lb.text = @"过敏记录";
                UIImageView *imgInput = [self createInputImage];
                textRecord = [self createInputText:imgInput];
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
            }
                break;
            case 7:
            {
                lb.text = @"备注";
                UIImageView *imgInput = [self createInputImage];
                textNotice = [self createInputText:imgInput];
                [imgCard addSubview:imgInput];
                CGRect frame = imgInput.frame;
                frame.origin = CGPointMake(lb.frame.origin.x+lb.frame.size.width+14, lb.frame.origin.y);
                imgInput.frame = frame;
            }
                break;
            case 8:
            {
                lb.text = @"卡片颜色";
                for (int i = 0; i < 5; i++) {
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                    [btn setFrame:CGRectMake(lb.frame.origin.x+lb.frame.size.width+14+38*i, lb.frame.origin.y, 29, 28)];
                    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"checked%d",i]] forState:UIControlStateNormal];
                    btn.tag = i;
                    [btn addTarget:self action:@selector(clickColorBtn:) forControlEvents:UIControlEventTouchUpInside];
                    [imgCard addSubview:btn];
                }
                
            }
                break;
                
            default:
                break;
        }
    }
}

- (UIImageView *)createInputImage{
    UIImageView *imgInput = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_input"]];
    imgInput.userInteractionEnabled = YES;
    return imgInput;
}

- (UITextField *)createInputText:(UIImageView *)imgInput{
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, imgInput.frame.size.width-20, imgInput.frame.size.height)];
    textField.backgroundColor = [UIColor clearColor];
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = [UIFont systemFontOfSize:13];
    textField.textColor = [@"#333333" colorWithHexString];
    textField.delegate = self;
    [imgInput addSubview:textField];
    return textField;
}

- (UIView *)createSingleCheckBtn:(BOOL)checked title:(NSString *)strTitle tag:(NSInteger)tag{
    UIView *vi = [[UIView alloc] initWithFrame:CGRectZero];
    vi.tag = tag;
    UIImage *img = [UIImage imageNamed:@"card_uncheck"];
    UIImageView *imgBg = [[UIImageView alloc] initWithImage:img];
    imgBg.tag = 1234;
    [vi addSubview:imgBg];
    
    if (checked) {
        UIImageView *checked = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_check"]];
        checked.center = imgBg.center;
        [imgBg addSubview:checked];
    }
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(imgBg.frame.origin.x+imgBg.frame.size.width+6, 0, 80, imgBg.frame.size.height)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [@"#333333" colorWithHexString];
    label.text = strTitle;
    [vi addSubview:label];
    vi.frame = CGRectMake(0, 0, label.frame.origin.x+label.frame.size.width, imgBg.frame.size.height);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = vi.bounds;
    btn.tag = tag;
    [btn addTarget:self action:@selector(clickSingleBtn:) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:btn];
    return vi;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    textSelected = textField;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [textSelected resignFirstResponder];
}

- (void)clickColorBtn:(id)sender{
    UIButton *btn = (UIButton *)sender;
    imgCard.image = [UIImage imageNamed:[NSString stringWithFormat:@"card_edit%d",btn.tag]];
}

- (void)clickSingleBtn:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag < 100) {
        [self setBtnChecked:arrayGender tag:btn.tag];
    }
    else {
        [self setBtnChecked:arrayBlood tag:btn.tag];
    }
}

- (void)setBtnChecked:(NSMutableArray *)array tag:(NSInteger)tag{
    for (int i = 0; i < array.count; i++) {
        UIView *vi = [array objectAtIndex:i];
        for (id element in [vi subviews]) {
            UIImageView *subImageView = (UIImageView *)element;
            if ([subImageView isKindOfClass:[UIImageView class]]) {
                if (subImageView.tag == 1234) {
                    for (id sub in [subImageView subviews]) {
                        [sub removeFromSuperview];
                    }
                    if (tag == vi.tag) {
                        UIImageView *checked = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_check"]];
                        checked.center = subImageView.center;
                        [subImageView addSubview:checked];
                    }
                }
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
