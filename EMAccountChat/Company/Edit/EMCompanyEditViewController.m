//
//  EMCompanyEditViewController.m
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMCompanyEditViewController.h"
#import "EMCompanyInfo.h"
#import "EMTextEditViewController.h"

@interface EMCompanyEditViewController ()<UITableViewDataSource, UITableViewDelegate, EMTextEditViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL needAdd;
@end

@implementation EMCompanyEditViewController

- (instancetype)initWithCompanyInfo:(EMCompanyInfo *)company
{
    self = [super init];
    if (self) {
        self.companyInfo = company;
        if (company == nil) {
            self.needAdd = YES;
            self.companyInfo = [[EMCompanyInfo alloc] init];
        }
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    
    [self createTableView];
}

- (void)setNavigation
{
    self.title = @"添加/更新公司";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]  initWithTitle:@"取消"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onNavigationBackButtonClicked:)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确认"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(onComfirmButtonClicked:)];
}

- (void)onNavigationBackButtonClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onComfirmButtonClicked:(id)sender
{
    if (self.needAdd) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(onAddCompanyButtonClicked:)]) {
            [self.delegate onAddCompanyButtonClicked:self];
        }
    } else {
        if (self.delegate && [self.delegate respondsToSelector:@selector(onEditComfirmButtonClicked:)]) {
            [self.delegate onEditComfirmButtonClicked:self];
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellID"];
    }

    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"公司名";
            cell.detailTextLabel.text = self.companyInfo.name;
        }
            break;
            
        case 1:
        {
            cell.textLabel.text = @"地点";
            cell.detailTextLabel.text = self.companyInfo.city;
        }
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        EMTextEditViewController *nameViewController = [[EMTextEditViewController alloc] initWithString:self.companyInfo.name];
        nameViewController.delegate = self;
        [self.navigationController pushViewController:nameViewController animated:YES];
    }
}

#pragma mark - EMTextEditViewControllerDelegate
- (void)onEditTextComfirmButtonClicked:(EMTextEditViewController *)viewController string:(NSString *)string
{
    self.companyInfo.name = string;
    [self.tableView reloadData];
}

@end
