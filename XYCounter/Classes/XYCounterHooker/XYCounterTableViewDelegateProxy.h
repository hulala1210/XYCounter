//
//  XYCounterTableViewDelegateProxy.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>
@protocol UITableViewDelegate;
NS_ASSUME_NONNULL_BEGIN

@interface XYCounterTableViewDelegateProxy : NSProxy <UITableViewDelegate>

+ (instancetype)proxyWithObject:(id <UITableViewDelegate>)object;

@end

NS_ASSUME_NONNULL_END
