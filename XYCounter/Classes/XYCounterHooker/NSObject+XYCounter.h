//
//  NSObject+XYCounter.h
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XYCounter)

+ (BOOL)xyCounter_swizzleInstanceMethod:(SEL)originalSel with:(SEL)newSel;

+ (BOOL)xyCounter_swizzleClassMethod:(SEL)originalSel with:(SEL)newSel;

- (void)xyCounter_setAssociateValue:(id)value withKey:(void *)key;

- (void)xyCounter_setAssociateWeakValue:(id)value withKey:(void *)key;

- (void)xyCounter_removeAssociatedValues;

- (id)xyCounter_getAssociatedValueForKey:(void *)key;

@end

NS_ASSUME_NONNULL_END
