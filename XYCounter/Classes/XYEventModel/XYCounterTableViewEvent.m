//
//  XYCounterTableViewEvent.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterTableViewEvent.h"

@implementation XYCounterTableViewEvent

- (NSString *)description {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"tableView ="];
    [string appendString:self.tableView.description];
    [string appendString:@"\n"];

    [string appendString:@"viewController ="];
    [string appendString:NSStringFromClass(self.viewController.class)];
    [string appendString:@"\n"];
    
    [string appendString:@"tableViewDelegate ="];
    [string appendString:self.tableViewDelegate.description];
    [string appendString:@"\n"];
    
    [string appendString:@"indexPath.section ="];
    [string appendString:[NSString stringWithFormat:@"%@",@(self.indexPath.section)]];
    [string appendString:@"\n"];
    
    [string appendString:@"indexPath.row ="];
    [string appendString:[NSString stringWithFormat:@"%@",@(self.indexPath.row)]];
    [string appendString:@"\n"];
    
    return [string copy];
}

@end
