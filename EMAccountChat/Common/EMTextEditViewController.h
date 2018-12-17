//
//  EMTextEditViewController.h
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMBaseViewController.h"

@class EMTextEditViewController;

@protocol EMTextEditViewControllerDelegate <NSObject>

- (void)onEditTextComfirmButtonClicked:(EMTextEditViewController *)viewController string:(NSString *)string;

@end


@interface EMTextEditViewController : EMBaseViewController

- (instancetype)initWithString:(NSString *)string;


@property (nonatomic, weak)id<EMTextEditViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSString *placeholder;

@end


