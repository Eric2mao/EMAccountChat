//
//  EMCompanyEditViewController.m
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMCompanyEditViewController.h"
#import "EMCompanyInfo.h"

@interface EMCompanyEditViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation EMCompanyEditViewController

- (instancetype)initWithCompanyInfo:(EMCompanyInfo *)company
{
    self = [super init];
    if (self) {
        self.companyInfo = company;
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
    if (self.companyInfo) {
        self.companyInfo.name = @"Tencent";
        self.companyInfo.city = @"shenzhen";
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(onEditComfirmButtonClicked:)]) {
            [self.delegate onEditComfirmButtonClicked:self];
        }
    } else {
        self.companyInfo = [[EMCompanyInfo alloc] init];
        self.companyInfo.name = @"Tencent";
        self.companyInfo.city = @"shenzhen";
        
        if (self.delegate && [self.delegate respondsToSelector:@selector(onAddCompanyButtonClicked:)]) {
            [self.delegate onAddCompanyButtonClicked:self];
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
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
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
    switch (indexPath.row) {
        case 0:
        {
            cell.textLabel.text = @"公司名";
            cell.detailTextLabel.text = @"腾讯";
        }
            break;
            
        case 1:
            cell.textLabel.text = @"地点";
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
        
    }
}

@end
