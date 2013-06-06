//
//  PKMenuViewController.m
//  PamaKids
//
//  Created by he chao on 13-5-14.
//  Copyright (c) 2013年 leon. All rights reserved.
//

#import "PKMenuViewController.h"
#import "PKNewsDetailViewController.h"
#import "DDMenuController.h"
#import "AppDelegate.h"
#import "PKHomeViewController.h"

@interface PKMenuViewController ()

@end

@implementation PKMenuViewController

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
    selSession = -1;
    selRow = -1;
    self.typeBackground = PKBackgroundTypeLeft;
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:iPhone5?@"main_bg-ip5":@"main_bg"]];
//    UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iPhone5?@"menu_bg-ip5":@"menu_bg"]];
//    [self.view addSubview:img];
    
    [self createNaviBar];
    self.strNaviTitle = @"目录";
    [self createNaviBtnLeft:[UIImage imageNamed:@"back_btn"]];
    
    [self loadTable];
    CGRect frame = myTableView.frame;
    frame.origin.x = 20;
    frame.size.width = 320-20-25;
    myTableView.frame = frame;
    
    [self loadHomePageData];
	// Do any additional setup after loading the view.
}

- (void)loadHomePageData{
    if (apiHomePage) {
        apiHomePage = nil;
    }
    apiHomePage = [[ApiCmdHomePage alloc] init];
    apiHomePage.m_requestUrl = @"/api/tags/首页";
    apiHomePage.delegate = self;
    [[PKConfig getApiClient] executeApiCmdGetAsync:apiHomePage WithBlock:self];
}

- (void) apiNotifyResult:(id) apiCmd  error:(NSError*) error{
    ApiCmdHomePage *result = (ApiCmdHomePage *)apiCmd;
    if (result.isReturnSuccess) {
        dictCategory = [result.dict valueForKey:@"categories"];
        [myTableView reloadData];
    }
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 38;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [dictCategory allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == selSession) {
        NSArray *arrayKey = [dictCategory allKeys];
        return [[dictCategory valueForKey:[arrayKey objectAtIndex:section]] count];
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 39;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, myTableView.frame.size.width, 38)];
    vi.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_session"]];
    
    UIImageView *imgSeperate = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_session_seperate"]];
    [vi addSubview:imgSeperate];
    
    if (selSession == section) {
        UIImageView *imgSel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_session_highlihgt"]];
        [vi addSubview:imgSel];
        
        
    }
    
    UIImageView *imgArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_bottom"]];
    imgArrow.frame = CGRectMake(vi.frame.size.width-imgArrow.frame.size.width, 0, imgArrow.frame.size.width, imgArrow.frame.size.height);
    CGRect frame = imgSeperate.frame;
    frame.origin.x = imgArrow.frame.origin.x-imgSeperate.frame.size.width;
    imgSeperate.frame = frame;
    [vi addSubview:imgArrow];
    
    if (selSession == section) {
        imgArrow.image = [UIImage imageNamed:@"arrow_top"];
    }
    
    UILabel *labelSession = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 200, 38)];
    labelSession.backgroundColor = [UIColor clearColor];
    labelSession.font = [UIFont systemFontOfSize:15];
    labelSession.textColor = [@"#333333" colorWithHexString];
    
    NSArray *arrayKey = [dictCategory allKeys];
    
    labelSession.text = [arrayKey objectAtIndex:section];
    [vi addSubview:labelSession];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = vi.frame;
    btn.tag = section;
    [btn addTarget:self action:@selector(clickSession:) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:btn];
    
    return vi;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentity = @"staticCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentity];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentity];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    for (id element in [cell.contentView subviews]) {
        [element removeFromSuperview];
    }
    
    UIImageView *imgLine = [[UIImageView alloc] initWithFrame:CGRectMake(17, 0, 3, 38)];
    imgLine.backgroundColor = [[@"#fbd862" colorWithHexString] colorWithAlphaComponent:0.2];
    [cell.contentView addSubview:imgLine];
    UIImageView *imgPoint = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yellow_circle"]];
    imgPoint.frame = CGRectMake(13, 12, imgPoint.frame.size.width, imgPoint.frame.size.height);
    [cell.contentView addSubview:imgPoint];
    
    if (indexPath.section == selSession && indexPath.row == selRow) {
        UIImageView *imgSel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_collection_selected"]];
        imgSel.frame = CGRectMake(17, 0, imgSel.frame.size.width-2, imgSel.frame.size.height);
        [cell.contentView addSubview:imgSel];
    }
    
    NSArray *arrayKey = [dictCategory allKeys];
    NSArray *arrayArticles = [dictCategory valueForKey:[arrayKey objectAtIndex:indexPath.section]];
    NSDictionary *dictArticle = [arrayArticles objectAtIndex:indexPath.row];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, 200, 38)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [@"#333333" colorWithHexString];
    label.text = [dictArticle valueForKey:@"title"];
    label.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:label];
    
    UIButton *btnLike = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLike.tag = indexPath.row;
    btnLike.frame = CGRectMake(myTableView.frame.size.width-40, 0, 40, 38);
    [btnLike setImage:[UIImage imageNamed:@"menu_like"] forState:UIControlStateNormal];
    [btnLike addTarget:self action:@selector(clickLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:btnLike];
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selRow = indexPath.row;
    [myTableView reloadData];
    
    NSArray *arrayKey = [dictCategory allKeys];
    NSArray *arrayArticles = [dictCategory valueForKey:[arrayKey objectAtIndex:indexPath.section]];
    NSDictionary *dictArticle = [arrayArticles objectAtIndex:indexPath.row];
    
    PKNewsDetailViewController *controller = [[PKNewsDetailViewController alloc] init];
    controller.dictArticle = dictArticle;
    
    [[self getMenuCtrl].navigationController pushViewController:controller animated:YES];
}

- (DDMenuController *)getMenuCtrl{
    return ((AppDelegate *)[UIApplication sharedApplication].delegate).homeController.slideOutCtrl;
}

- (void)clickSession:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (btn.tag == selSession) {
        selSession = -1;
    }
    else {
        selSession = btn.tag;
    }
    selRow = -1;
    [myTableView reloadData];
}

- (void)clickLikeBtn:(id)sender{
    UIButton *btn = (UIButton *)sender;
    [btn setImage:[UIImage imageNamed:@"menu_like_checked"] forState:UIControlStateNormal];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
