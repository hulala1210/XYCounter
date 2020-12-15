//
//  XYCounterControlEvent.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYCounterControlEvent : NSObject

@property (strong, nonatomic) UIControl *sender;
@property (strong, nonatomic) id target;
@property (assign, nonatomic) SEL action;
@property (strong, nonatomic) UIViewController *viewController;
@property (strong, nonatomic) UIEvent *event;

@end

NS_ASSUME_NONNULL_END
