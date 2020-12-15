//
//  XYCounterControlEvent.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterControlEvent.h"

@implementation XYCounterControlEvent

- (NSString *)description {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"sender ="];
    [string appendString:self.sender.description];
    [string appendString:@"\n"];

    [string appendString:@"target ="];
    [string appendString:NSStringFromClass([self.target class])];
    [string appendString:@"\n"];
    
    [string appendString:@"action ="];
    [string appendString:NSStringFromSelector(self.action)];
    [string appendString:@"\n"];
    
    [string appendString:@"viewController ="];
    [string appendString:NSStringFromClass(self.viewController.class)];
    [string appendString:@"\n"];
    
    [string appendString:@"event ="];
    [string appendString:self.event.description];
    [string appendString:@"\n"];
    
    return [string copy];
}

@end
