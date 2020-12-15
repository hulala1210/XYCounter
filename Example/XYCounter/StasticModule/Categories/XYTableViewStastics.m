//
//  XYTableViewStastics.m
//  XYCounter_Example
//
//  Created by Kevin Chen on 2020/12/14.
//  Copyright © 2020 谌彦霖. All rights reserved.
//

#import "XYTableViewStastics.h"
#import "XYTableViewController.h"

@interface XYTableViewController ()

@property (strong, nonatomic) NSArray <NSNumber *>*datas;

@end

@implementation XYTableViewStastics
- (BOOL)xyCounter_handleEnterViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[XYTableViewController class]]) {
        NSLog(@"统计数据 %s %@",__func__, NSStringFromClass([XYTableViewController class]));
        return YES;
    }
    
    return NO;
}

- (BOOL)xyCounter_handleLeaveViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[XYTableViewController class]]) {
        NSLog(@"统计数据 %s %@",__func__, NSStringFromClass([XYTableViewController class]));
        return YES;
    }
    return NO;
}

- (BOOL)xyCounter_handleTableViewDidSelectRowWithEvent:(XYCounterTableViewEvent *)event {
    if ([event.viewController isKindOfClass:[XYTableViewController class]]) {
        XYTableViewController *vc = (XYTableViewController *)event.viewController;
        NSNumber *number = [vc.datas objectAtIndex:event.indexPath.row];
        NSLog(@"统计数据 %s %@",__func__, number);
        return YES;
    }
    return NO;
}



@end
