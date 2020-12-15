//
//  UITableView+XYCounterHooker.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <UIKit/UIKit.h>
#import <YYKit/YYKit.h>

NS_ASSUME_NONNULL_BEGIN
@class XYCounterTableViewDelegateProxy;
@interface UITableView (XYCounterHooker)

@property (strong, nonatomic) XYCounterTableViewDelegateProxy *xyCounter_delegateProxy;
- (void)xyCounter_setDelegate:(id<UITableViewDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
