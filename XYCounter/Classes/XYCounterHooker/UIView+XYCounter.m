//
//  UIView+XYCounter.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/11.
//

#import "UIView+XYCounter.h"

@implementation UIView (XYCounter)
- (UIViewController *)xyCounter_getViewController {
    UIResponder *responder = self;
    while ((responder = [responder nextResponder])) {
        if ([responder isKindOfClass: [UIViewController class]]){
            return (UIViewController *)responder;
        }
    }
    return nil;
}
@end
