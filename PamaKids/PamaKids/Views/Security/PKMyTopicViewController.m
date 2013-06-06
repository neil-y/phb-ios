//
//  PKMyTopicViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-15.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKMyTopicViewController.h"
#import "PKSafeChatCell.h"

@interface PKMyTopicViewController ()

@end

@implementation PKMyTopicViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"page_bg"]];//[UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
    [self createNaviBar];
    self.strNaviTitle = @"我的话题";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    UIImageView *imgLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_line"]];
    imgLine.center = CGPointMake(160, 59);
    [self.view addSubview:imgLine];
    [self loadTable];
    myTableView.frame = CGRectMake(0, 60, 320, self.view.frame.size.height-60);
    
    [self getMyTopics];
	// Do any additional setup after loading the view.
}

- (void)getMyTopics{
    if (apiArticles) {
        apiArticles = nil;
    }
    apiArticles = [[HttpCmdGet alloc] init];
    apiArticles.m_requestUrl = @"/api/articles?user_id=1";
    apiArticles.delegate = self;
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiArticles WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    HttpCmdGet *result = (HttpCmdGet *)apiCmd;
    if (result.isReturnSuccess) {
        dictArticles = (NSMutableDictionary *)result.dict;
    }
    
    [myTableView reloadData];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[dictArticles valueForKey:@"articles"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKSafeChatCell *cell = (PKSafeChatCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKSafeChatCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    for (id element in [cell.contentView subviews]) {
        [element removeFromSuperview];
    }
    
    [cell performSelector:@selector(loadContent)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
