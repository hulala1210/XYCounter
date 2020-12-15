//
//  XYCounterCollectionViewEvent.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterCollectionViewEvent : NSObject

@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) id <UICollectionViewDelegate> collectionViewDelegate;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

NS_ASSUME_NONNULL_END
