//
//  XYCounterEventDistributor.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterEventDistributor.h"

@interface XYCounterEventDistributor ()

@property (strong, nonatomic) NSMutableSet *reactObjects;
@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation XYCounterEventDistributor

+ (instancetype)sharedInstance {
    static XYCounterEventDistributor *distributor = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        distributor = [[XYCounterEventDistributor alloc] init];
        distributor.reactObjects = [[NSMutableSet alloc] init];
        distributor.queue = [[NSOperationQueue alloc] init];
        distributor.queue.maxConcurrentOperationCount = 1;
    });
    
    return distributor;
}

+ (void)addEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver {
    [[[self sharedInstance] queue] addOperationWithBlock:^{
        if (![[[self sharedInstance] reactObjects] containsObject:receiver]) {
            [[[self sharedInstance] reactObjects] addObject:receiver];
        }
    }];
}

+ (void)removeEventReceiver:(id <XYCounterEventsDistributeProtocol>)receiver {
    [[[self sharedInstance] queue] addOperationWithBlock:^{
        [[[self sharedInstance] reactObjects] removeObject:receiver];
    }];
}

#pragma mark - XYCounterEventsDistributeProtocol
- (void)handleEnterViewController:(UIViewController *)viewController {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleEnterViewController:)]) {
                handle = [receiver xyCounter_handleEnterViewController:viewController];
                if (handle) {
                    break;
                }
            }
        }
    }];
    
}

- (void)handleLeaveViewController:(UIViewController *)viewController {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleLeaveViewController:)]) {
                handle = [receiver xyCounter_handleLeaveViewController:viewController];
                if (handle) {
                    break;
                }
            }
        }
    }];
    
}


- (void)handleTableViewDidSelectRowWithEvent:(XYCounterTableViewEvent *)event {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleTableViewDidSelectRowWithEvent:)]) {
                handle = [receiver xyCounter_handleTableViewDidSelectRowWithEvent:event];
                if (handle) {
                    break;
                }
            }
        }
    }];
    
}

- (void)handleCollectionViewDidSelectRowWithEvent:(XYCounterCollectionViewEvent *)event {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleCollectionViewDidSelectRowWithEvent:)]) {
                handle = [receiver xyCounter_handleCollectionViewDidSelectRowWithEvent:event];
                if (handle) {
                    break;
                }
            }
        }
    }];
    
}

- (void)handleControlEvent:(XYCounterControlEvent *)event {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleControlEvent:)]) {
                handle = [receiver xyCounter_handleControlEvent:event];
                if (handle) {
                    break;
                }
            }
        }
    }];
    
}

- (void)handleGestureRecognizerEvent:(XYCounterGestureEvent *)event {
    [[self queue] addOperationWithBlock:^{
        NSSet *table = [[self reactObjects] copy];
        BOOL handle = NO;
        for (id <XYCounterEventsDistributeProtocol>receiver in table) {
            if ([receiver respondsToSelector:@selector(xyCounter_handleGestureRecognizerEvent:)]) {
                handle = [receiver xyCounter_handleGestureRecognizerEvent:event];
                if (handle) {
                    break;
                }
            }
        }
    }];
}

@end
