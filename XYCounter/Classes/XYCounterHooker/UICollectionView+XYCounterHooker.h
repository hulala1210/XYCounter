//
//  UICollectionView+XYCounterHooker.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class XYCounterCollectionViewDelegateProxy;
@interface UICollectionView (XYCounterHooker)

@property (strong, nonatomic) XYCounterCollectionViewDelegateProxy * _Nullable xyCounter_delegateProxy;
- (void)xyCounter_setDelegate:(id<UICollectionViewDelegate> _Nullable)delegate;
@end

NS_ASSUME_NONNULL_END
