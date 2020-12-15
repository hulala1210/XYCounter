//
//  UICollectionView+XYCounterHooker.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "UICollectionView+XYCounterHooker.h"
#import "XYCounterCollectionViewDelegateProxy.h"
#import <YYKit/YYKit.h>

static void *xyCounterCollectionProxyKey = "xyCounterCollectionProxyKey";

@implementation UICollectionView (XYCounterHooker)

- (void)setXyCounter_delegateProxy:(XYCounterCollectionViewDelegateProxy *)xyCounter_delegateProxy {
    [self setAssociateValue:xyCounter_delegateProxy withKey:&xyCounterCollectionProxyKey];
}

- (XYCounterCollectionViewDelegateProxy *)xyCounter_delegateProxy {
    return [self getAssociatedValueForKey:&xyCounterCollectionProxyKey];
}

- (void)xyCounter_setDelegate:(id<UICollectionViewDelegate>)delegate {
    XYCounterCollectionViewDelegateProxy *proxy = [XYCounterCollectionViewDelegateProxy proxyWithObject:delegate];
    [self xyCounter_setDelegate:proxy];
    self.xyCounter_delegateProxy = proxy;
    
}

@end
