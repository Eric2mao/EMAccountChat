//
//  EMCompanyInfo.m
//  EMAccountChat
//
//  Created by Mao Yuxi on 2018/12/17.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "EMCompanyInfo.h"

@implementation EMCompanyInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ %@", _name, _city];
}

@end
