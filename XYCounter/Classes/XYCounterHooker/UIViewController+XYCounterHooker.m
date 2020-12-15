//
//  UIViewController+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/14.
//

#import "UIViewController+XYCounterHooker.h"
#import "XYCounterEventDistributor.h"

@implementation UIViewController (XYCounterHooker)

- (void)xyCounter_viewDidAppear {
    [self xyCounter_viewDidAppear];
    [[XYCounterEventDistributor sharedInstance] handleEnterViewController:self];
}

- (void)xyCounter_viewDidDisappear {
    [self xyCounter_viewDidDisappear];
    [[XYCounterEventDistributor sharedInstance] handleLeaveViewController:self];
}

@end
