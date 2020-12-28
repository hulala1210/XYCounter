//
//  UITableView+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "UITableView+XYCounterHooker.h"
#import "XYCounterTableViewDelegateProxy.h"

static void *xyCounterTableProxyKey = "xyCounterTableProxyKey";

@implementation UITableView (XYCounterHooker)

- (void)setXyCounter_delegateProxy:(XYCounterTableViewDelegateProxy * _Nullable)xyCounter_delegateProxy {
    [self xyCounter_setAssociateValue:xyCounter_delegateProxy withKey:&xyCounterTableProxyKey];
}

- (XYCounterTableViewDelegateProxy *)xyCounter_delegateProxy {
    return [self xyCounter_getAssociatedValueForKey:&xyCounterTableProxyKey];
}

- (void)xyCounter_setDelegate:(id<UITableViewDelegate> _Nullable)delegate {
    
    if (delegate == nil) {
        [self xyCounter_setDelegate:nil];
        self.xyCounter_delegateProxy = nil;
        return;
    }
    
    XYCounterTableViewDelegateProxy *proxy = [XYCounterTableViewDelegateProxy proxyWithObject:delegate];
    [self xyCounter_setDelegate:proxy];
    self.xyCounter_delegateProxy = proxy;
}


@end
