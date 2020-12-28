//
//  UIApplication+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/11.
//

#import "UIApplication+XYCounterHooker.h"
#import "XYCounterControlEvent.h"
#import "UIView+XYCounter.h"
#import "XYCounterEventDistributor.h"

@implementation UIApplication (XYCounterHooker)

- (BOOL)xyCounter_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event {
    
    if ([sender isKindOfClass:UISlider.class] && event.allTouches.anyObject.phase != UITouchPhaseEnded) {
        return [self xyCounter_sendAction:action to:target from:sender forEvent:event];
    }
    
    XYCounterControlEvent *controlEvent = [[XYCounterControlEvent alloc] init];
    controlEvent.sender = sender;
    controlEvent.target = target;
    controlEvent.action = action;
    
    if ([sender respondsToSelector:@selector(xyCounter_getViewController)]) {
        controlEvent.viewController = [sender xyCounter_getViewController];
    }
    
    controlEvent.event = event;
    [[XYCounterEventDistributor sharedInstance] handleControlEvent:controlEvent];

    return [self xyCounter_sendAction:action to:target from:sender forEvent:event];
}

@end
