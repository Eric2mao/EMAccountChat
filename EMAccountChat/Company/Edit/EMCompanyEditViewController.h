//
//  EMCompanyEditViewController.h
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMBaseViewController.h"

@class EMCompanyEditViewController;
@class EMCompanyInfo;

@protocol EMCompanyEditViewControllerDelegate <NSObject>

- (void)onEditComfirmButtonClicked:(EMCompanyEditViewController *)viewController;
- (void)onAddCompanyButtonClicked:(EMCompanyEditViewController *)viewController;

@end


@interface EMCompanyEditViewController : EMBaseViewController

@property (nonatomic, weak)id<EMCompanyEditViewControllerDelegate> delegate;
@property (nonatomic, strong) EMCompanyInfo *companyInfo;

- (instancetype)initWithCompanyInfo:(EMCompanyInfo *)company;

@end


