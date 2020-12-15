//
//  XYCounter.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>
#import "XYCounterEventsDistributeProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYCounter : NSObject

+ (void)startWithAddEventReceiverAction:(void(^)(void))addAction;

+ (void)addEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver;
+ (void)removeEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver;

@end

NS_ASSUME_NONNULL_END
