//
//  XYCounterTableViewDelegateProxy.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterTableViewDelegateProxy.h"
#import "XYCounterEventDistributor.h"
#import "XYCounterTableViewEvent.h"

@interface XYCounterTableViewDelegateProxy ()

{
    __weak NSObject <UITableViewDelegate> *_delegate;
}

@end

@implementation XYCounterTableViewDelegateProxy
+ (instancetype)proxyWithObject:(id<UITableViewDelegate>)object {
    
    if (object != nil) {
        NSAssert([object conformsToProtocol:@protocol(UITableViewDelegate)], @"XYCounterTableViewDelegateProxy must created with an object which comforms 'UITableViewDelegate' protocol");
    }
    
    
    XYCounterTableViewDelegateProxy *proxy = [XYCounterTableViewDelegateProxy alloc];
    proxy->_delegate = object;
    return proxy;
}

//  拦截此 delegate 方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [_delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    
    UIViewController *viewController = nil;
    UIResponder *responder = tableView;
    
    while (responder) {
        responder = responder.nextResponder;
        if ([responder isKindOfClass:[UIViewController class]]) {
            viewController = (UIViewController *)responder;
            break;
        } else if ([responder isKindOfClass:[UIWindow class]]) {
            break;
        }
    }
    
    XYCounterTableViewEvent *event = [[XYCounterTableViewEvent alloc] init];
    event.viewController = viewController;
    event.tableView = tableView;
    event.tableViewDelegate = _delegate;
    event.indexPath = indexPath;
    [[XYCounterEventDistributor sharedInstance] handleTableViewDidSelectRowWithEvent:event];
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
