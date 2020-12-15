//
//  XYCounter.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounter.h"
#import "XYCounterEventDistributor.h"
#import "XYCounterHooker/XYCounterHooker.h"

@implementation XYCounter

+ (void)startWithAddEventReceiverAction:(void (^)(void))addAction {
    [XYCounterHooker hook];
    if (addAction) {
        addAction();
    }
}

+ (void)addEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver {
    [XYCounterEventDistributor addEventReceiver:receiver];
}

+ (void)removeEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver {
    [XYCounterEventDistributor removeEventReceiver:receiver];
}

@end
