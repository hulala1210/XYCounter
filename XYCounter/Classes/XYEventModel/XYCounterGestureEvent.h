//
//  XYCounterGestureEvent.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterGestureEvent : NSObject

@property (strong, nonatomic) UIGestureRecognizer *sender;
@property (strong, nonatomic) UIView *view;
@property (strong, nonatomic) UIViewController *viewController;

@end

NS_ASSUME_NONNULL_END
