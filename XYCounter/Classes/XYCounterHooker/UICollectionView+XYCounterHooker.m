//
//  UICollectionView+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "UICollectionView+XYCounterHooker.h"
#import "XYCounterCollectionViewDelegateProxy.h"
#import "NSObject+XYCounter.h"

static void *xyCounterCollectionProxyKey = "xyCounterCollectionProxyKey";

@implementation UICollectionView (XYCounterHooker)

- (void)setXyCounter_delegateProxy:(XYCounterCollectionViewDelegateProxy * _Nullable)xyCounter_delegateProxy {
    [self xyCounter_setAssociateValue:xyCounter_delegateProxy withKey:&xyCounterCollectionProxyKey];
}

- (XYCounterCollectionViewDelegateProxy *)xyCounter_delegateProxy {
    return [self xyCounter_getAssociatedValueForKey:&xyCounterCollectionProxyKey];
}

- (void)xyCounter_setDelegate:(id<UICollectionViewDelegate> _Nullable)delegate {
    if (delegate == nil) {
        [self xyCounter_setDelegate:nil];
        self.xyCounter_delegateProxy = nil;
        return;
    }
    XYCounterCollectionViewDelegateProxy *proxy = [XYCounterCollectionViewDelegateProxy proxyWithObject:delegate];
    [self xyCounter_setDelegate:proxy];
    self.xyCounter_delegateProxy = proxy;
    
}

@end
