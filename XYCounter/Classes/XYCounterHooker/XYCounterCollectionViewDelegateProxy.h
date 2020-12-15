//
//  XYCounterCollectionViewDelegateProxy.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>
@protocol UICollectionViewDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterCollectionViewDelegateProxy : NSProxy <UICollectionViewDelegate>
+ (instancetype)proxyWithObject:(id <UICollectionViewDelegate>)object;

@end

NS_ASSUME_NONNULL_END
