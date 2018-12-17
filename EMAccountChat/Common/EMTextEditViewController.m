//
//  EMTextEditViewController.m
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMTextEditViewController.h"

@interface EMTextEditViewController ()

@property (nonatomic, strong) UITextField *textFeild;

@end

@implementation EMTextEditViewController

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self) {
        self.string = string;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    
    [self createSubView];
}

- (void)setNavigation
{
    self.title = @"编辑";
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(onEditTextComfirmButtonClicked:string:)]) {
        [self.delegate onEditTextComfirmButtonClicked:self string:self.textFeild.text];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)createSubView
{
    UITextField *textFeild = [[UITextField alloc] initWithFrame:CGRectMake(10, 110, self.view.frame.size.width - 20, 50)];
    textFeild.text = self.string;
    textFeild.placeholder = self.placeholder;
    textFeild.backgroundColor = [UIColor grayColor];
    self.textFeild = textFeild;
    [self.view addSubview:textFeild];
}

@end
