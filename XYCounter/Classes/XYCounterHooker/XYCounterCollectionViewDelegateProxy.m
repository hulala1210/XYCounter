//
//  XYCounterCollectionViewDelegateProxy.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterCollectionViewDelegateProxy.h"
#import "XYCounterEventDistributor.h"
#import "XYCounterCollectionViewEvent.h"

@interface XYCounterCollectionViewDelegateProxy ()

{
    __weak NSObject <UICollectionViewDelegate> *_delegate;
}

@end

@implementation XYCounterCollectionViewDelegateProxy

+ (instancetype)proxyWithObject:(id<UICollectionViewDelegate>)object {
    
    NSAssert([object conformsToProtocol:@protocol(UICollectionViewDelegate)], @"XYCounterCollectionViewDelegateProxy must created with an object which comforms 'UICollectionViewDelegate' protocol");
    
    XYCounterCollectionViewDelegateProxy *proxy = [XYCounterCollectionViewDelegateProxy alloc];
    proxy->_delegate = object;
    return proxy;
}

//  拦截此 delegate 方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(collectionView:didSelectItemAtIndexPath:)]) {
        [_delegate collectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
    
    UIViewController *viewController = nil;
    UIResponder *responder = collectionView;
    
    while (responder) {
        responder = responder.nextResponder;
        if ([responder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)responder;
            break;
        } else if ([responder isKindOfClass:[UIWindow class]]) {
            break;
        }
    }
    
    XYCounterCollectionViewEvent *event = [[XYCounterCollectionViewEvent alloc] init];
    event.viewController = viewController;
    event.collectionView = collectionView;
    event.collectionViewDelegate = _delegate;
    event.indexPath = indexPath;
    [[XYCounterEventDistributor sharedInstance] handleCollectionViewDidSelectRowWithEvent:event];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    BOOL conforms = [super conformsToProtocol:aProtocol];
    return conforms;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL hasResponds = [_delegate respondsToSelector:aSelector];
    return hasResponds;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *methodSignature = nil;
    
    // 如果delegate被释放了，也就是delegate为nil，也要允许delegate继续执行方法
    if (_delegate == nil) {
        methodSignature = [NSObject instanceMethodSignatureForSelector:@selector(class)];
    }
    else {
        methodSignature = [_delegate methodSignatureForSelector:sel];
    }
    
    return methodSignature;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    SEL sel = [invocation selector];
    if ([_delegate respondsToSelector:sel]) {
        [invocation invokeWithTarget:_delegate];
    }

}


@end
