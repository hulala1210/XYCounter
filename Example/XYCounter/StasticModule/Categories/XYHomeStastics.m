//
//  XYHomeStastics.m
//  XYCounter_Example
//
//  Created by Kevin Chen on 2020/12/14.
//  Copyright © 2020 谌彦霖. All rights reserved.
//

#import "XYHomeStastics.h"
#import "XYHomeController.h"

@interface XYHomeController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *swt;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;
@end

@implementation XYHomeStastics
- (BOOL)xyCounter_handleEnterViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[XYHomeController class]]) {
        NSLog(@"统计数据 %s %@",__func__, NSStringFromClass([XYHomeController class]));
        return YES;
    }
    
    return NO;
}

- (BOOL)xyCounter_handleLeaveViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[XYHomeController class]]) {
        NSLog(@"统计数据 %s %@",__func__, NSStringFromClass([XYHomeController class]));
        return YES;
    }
    return NO;
}

- (BOOL)xyCounter_handleControlEvent:(XYCounterControlEvent *)event {
    if ([event.viewController isKindOfClass:[XYHomeController class]]) {
        XYHomeController *vc = (XYHomeController *)event.viewController;
        if (event.sender == vc.button) {
            NSLog(@"统计数据 XYHomeController 点击按钮");
            return YES;
        }
        else if (event.sender == vc.slider) {
            NSLog(@"统计数据 XYHomeController 滑动滑块");
            return YES;
        }
        else if (event.sender == vc.swt) {
            NSLog(@"统计数据 XYHomeController 操作开关");
            return YES;
        }
    }
    return NO;
}

- (BOOL)xyCounter_handleGestureRecognizerEvent:(XYCounterGestureEvent *)event {
    if ([event.viewController isKindOfClass:[XYHomeController class]]) {
        XYHomeController *vc = (XYHomeController *)event.viewController;
        if (event.sender == vc.longPressGesture) {
            NSLog(@"统计数据 XYHomeController 长按label");
            return YES;
        }
    }
    return NO;
}
@end
