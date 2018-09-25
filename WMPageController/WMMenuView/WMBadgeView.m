//
//  WMBadgeView.m
//  WMPageController
//
//  Created by zmz on 2018/9/21.
//  Copyright © 2018年 yq. All rights reserved.
//

#import "WMBadgeView.h"

@implementation WMBadgeView

+ (instancetype)createWithBadge:(NSInteger)badge {
    //0时不显示
    if (badge < 1) { return nil; }
    
    WMBadgeView *badgeView = [[WMBadgeView alloc] init];
    [badgeView loadBadgeLabel];
    [badgeView loadBadgeText:badge];
    return badgeView;
}

- (void)loadBadgeLabel {
    //
    self.backgroundColor = [UIColor clearColor];
    self.textColor = [UIColor colorWithRed:255/255.0 green:67/255.0 blue:30/255.0 alpha:1/1.0];
    self.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:12];
    self.textAlignment = NSTextAlignmentCenter;
}

- (void)loadBadgeText:(NSInteger)badge {
    //文本内容
    NSString *badge_str = (badge>99)?@"99+":[NSString stringWithFormat:@"%ld", (long)badge];
    self.text = badge_str;
    //fit
    CGSize size = [badge_str sizeWithAttributes:@{NSFontAttributeName: self.font}];
    self.bounds = CGRectMake(0, 0, size.width+10, size.height);
}

@end
