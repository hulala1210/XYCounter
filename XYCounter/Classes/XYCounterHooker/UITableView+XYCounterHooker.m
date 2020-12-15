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

- (void)setXyCounter_delegateProxy:(XYCounterTableViewDelegateProxy *)xyCounter_delegateProxy {
    [self setAssociateValue:xyCounter_delegateProxy withKey:&xyCounterTableProxyKey];
}

- (XYCounterTableViewDelegateProxy *)xyCounter_delegateProxy {
    return [self getAssociatedValueForKey:&xyCounterTableProxyKey];
}

- (void)xyCounter_setDelegate:(id<UITableViewDelegate>)delegate {
    XYCounterTableViewDelegateProxy *proxy = [XYCounterTableViewDelegateProxy proxyWithObject:delegate];
    [self xyCounter_setDelegate:proxy];
    self.xyCounter_delegateProxy = proxy;
}


@end
