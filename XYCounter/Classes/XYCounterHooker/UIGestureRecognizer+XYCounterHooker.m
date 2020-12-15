//
//  UIGestureRecognizer+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/11.
//

#import "UIGestureRecognizer+XYCounterHooker.h"
#import "XYCounterGestureEvent.h"
#import "UIView+XYCounter.h"
#import "XYCounterEventDistributor.h"

@implementation UIGestureRecognizer (XYCounterHooker)
- (instancetype)xyCounter_initWithTarget:(id)target action:(SEL)action {
    [self xyCounter_initWithTarget:target action:action];
    
    return self;
}

- (void)xyCounter_addTarget:(id)target action:(SEL)action {
    [self xyCounter_addTarget:target action:action];
    [self xyCounter_addTarget:self action:@selector(gestureAcion:)];
}

- (void)gestureAcion:(UIGestureRecognizer *)gesture {
    XYCounterGestureEvent *gestureEvent = [[XYCounterGestureEvent alloc] init];
    gestureEvent.sender = gesture;
    gestureEvent.view = gesture.view;
    gestureEvent.viewController = [gesture.view xyCounter_getViewController];

    [[XYCounterEventDistributor sharedInstance] handleGestureRecognizerEvent:gestureEvent];
    
}

@end
