//
//  XYCounterEventDistributor.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>
#import "XYCounterEventsDistributeProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterEventDistributor : NSObject

+ (instancetype)sharedInstance;

+ (void)addEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver;
+ (void)removeEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver;


- (void)handleEnterViewController:(UIViewController *)viewController;
- (void)handleLeaveViewController:(UIViewController *)viewController;

- (void)handleTableViewDidSelectRowWithEvent:(XYCounterTableViewEvent *)event;
- (void)handleCollectionViewDidSelectRowWithEvent:(XYCounterCollectionViewEvent *)event;

- (void)handleControlEvent:(XYCounterControlEvent *)event;

- (void)handleGestureRecognizerEvent:(XYCounterGestureEvent *)event;

@end

NS_ASSUME_NONNULL_END
