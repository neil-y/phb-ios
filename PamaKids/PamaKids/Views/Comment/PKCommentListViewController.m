//
//  PKCommentListViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-1.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKCommentListViewController.h"
#import "PKCommentCell.h"

@interface PKCommentListViewController ()

@end

@implementation PKCommentListViewController

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
    [self createNaviBar];
    self.strNaviTitle = @"我的评论";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadContent];
	// Do any additional setup after loading the view.
}

- (void)getMyComments{
    if (apiComments) {
        apiComments = nil;
    }
    apiComments = [[HttpCmdGet alloc] init];
    apiComments.m_requestUrl = @"/api/comments?user_id=1";
    apiComments.delegate = self;
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiComments WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    HttpCmdGet *result = (HttpCmdGet *)apiCmd;
    if (result.isReturnSuccess) {
        dictComments = (NSMutableDictionary *)result.dict;
    }
    
    [myTableView reloadData];
}

- (void)loadContent{
    [self loadTable];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 67;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    PKCommentCell *cell = (PKCommentCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[PKCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
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
