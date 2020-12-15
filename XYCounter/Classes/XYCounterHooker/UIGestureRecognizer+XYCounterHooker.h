//
//  UIGestureRecognizer+XYCounterHooker.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIGestureRecognizer (XYCounterHooker)
- (instancetype)xyCounter_initWithTarget:(id)target action:(SEL)action;
- (void)xyCounter_addTarget:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
