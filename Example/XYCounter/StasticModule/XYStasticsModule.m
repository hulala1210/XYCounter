//
//  XYStasticsModule.m
//  XYCounter_Example
//
//  Created by Kevin Chen on 2020/12/14.
//  Copyright © 2020 谌彦霖. All rights reserved.
//

#import "XYStasticsModule.h"
#import <XYCounter/XYCounter.h>
#import "XYHomeStastics.h"
#import "XYTableViewStastics.h"
#import "XYCollectionViewStastics.h"

@implementation XYStasticsModule

+ (void)startModule {
    [XYCounter startWithAddEventReceiverAction:^{
        [XYCounter addEventReceiver:[[XYHomeStastics alloc] init]];
        [XYCounter addEventReceiver:[[XYTableViewStastics alloc] init]];
        [XYCounter addEventReceiver:[[XYCollectionViewStastics alloc] init]];
    }];
}

@end
