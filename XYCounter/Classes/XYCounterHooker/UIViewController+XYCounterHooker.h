//
//  UIViewController+XYCounterHooker.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (XYCounterHooker)

- (void)xyCounter_viewDidAppear;
- (void)xyCounter_viewDidDisappear;

@end

NS_ASSUME_NONNULL_END
