//
//  XYCounterEventsDistributeProtocol.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <UIKit/UIKit.h>
#import "XYCounterTableViewEvent.h"
#import "XYCounterCollectionViewEvent.h"
#import "XYCounterControlEvent.h"
#import "XYCounterGestureEvent.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XYCounterEventsDistributeProtocol <NSObject>

@optional
- (BOOL)xyCounter_handleEnterViewController:(UIViewController *)viewController;
- (BOOL)xyCounter_handleLeaveViewController:(UIViewController *)viewController;

@optional
- (BOOL)xyCounter_handleTableViewDidSelectRowWithEvent:(XYCounterTableViewEvent *)event;
- (BOOL)xyCounter_handleCollectionViewDidSelectRowWithEvent:(XYCounterCollectionViewEvent *)event;

@optional
- (BOOL)xyCounter_handleControlEvent:(XYCounterControlEvent *)event;

@optional
- (BOOL)xyCounter_handleGestureRecognizerEvent:(XYCounterGestureEvent *)event;

@end

NS_ASSUME_NONNULL_END
