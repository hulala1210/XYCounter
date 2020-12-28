//
//  XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterHooker.h"
#import "NSObject+XYCounter.h"
#import "UITableView+XYCounterHooker.h"
#import "UICollectionView+XYCounterHooker.h"
#import "UIApplication+XYCounterHooker.h"
#import "UIGestureRecognizer+XYCounterHooker.h"
#import "UIViewController+XYCounterHooker.h"

@implementation XYCounterHooker
+ (void)hook {
    [UITableView xyCounter_swizzleInstanceMethod:@selector(setDelegate:) with:@selector(xyCounter_setDelegate:)];
    [UICollectionView xyCounter_swizzleInstanceMethod:@selector(setDelegate:) with:@selector(xyCounter_setDelegate:)];
    [UIApplication xyCounter_swizzleInstanceMethod:@selector(sendAction:to:from:forEvent:) with:@selector(xyCounter_sendAction:to:from:forEvent:)];
    [UIGestureRecognizer xyCounter_swizzleInstanceMethod:@selector(initWithTarget:action:) with:@selector(xyCounter_initWithTarget:action:)];
    [UIGestureRecognizer xyCounter_swizzleInstanceMethod:@selector(addTarget:action:) with:@selector(xyCounter_addTarget:action:)];
    [UIViewController xyCounter_swizzleInstanceMethod:@selector(xyCounter_viewDidAppear) with:@selector(viewDidAppear:)];
    [UIViewController xyCounter_swizzleInstanceMethod:@selector(xyCounter_viewDidDisappear) with:@selector(viewDidDisappear:)];
}
@end
