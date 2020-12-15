//
//  XYCollectionViewStastics.m
//  XYCounter_Example
//
//  Created by Kevin Chen on 2020/12/14.
//  Copyright © 2020 谌彦霖. All rights reserved.
//

#import "XYCollectionViewStastics.h"
#import "XYCollectionViewController.h"
@interface XYCollectionViewController ()

@property (strong, nonatomic) NSArray <NSNumber *>*datas;

@end
@implementation XYCollectionViewStastics
- (BOOL)xyCounter_handleCollectionViewDidSelectRowWithEvent:(XYCounterCollectionViewEvent *)event {
    
    if ([event.viewController isKindOfClass:[XYCollectionViewController class]]) {
        XYCollectionViewController *vc = (XYCollectionViewController *)event.viewController;
        NSNumber *number = [vc.datas objectAtIndex:event.indexPath.item];
        NSLog(@"统计数据 %s %@",__func__, number);
        return YES;
    }
    
    return NO;
}



@end
