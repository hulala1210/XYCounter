//
//  XYCounterTableViewEvent.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterTableViewEvent : NSObject
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) id <UITableViewDelegate> tableViewDelegate;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
