//
//  UIApplication+XYCounterHooker.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (XYCounterHooker)

- (BOOL)xyCounter_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
