//
//  XYCounterGestureEvent.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterGestureEvent.h"

@implementation XYCounterGestureEvent

- (NSString *)description {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"sender ="];
    [string appendString:self.sender.description];
    [string appendString:@"\n"];

    [string appendString:@"view ="];
    [string appendString:self.view.description];
    [string appendString:@"\n"];
    
    [string appendString:@"viewController ="];
    [string appendString:NSStringFromClass(self.viewController.class)];
    [string appendString:@"\n"];
    
    return [string copy];
}

@end
