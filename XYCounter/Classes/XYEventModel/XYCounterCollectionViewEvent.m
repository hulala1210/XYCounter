//
//  XYCounterCollectionViewEvent.m
//  XYCounter
//
//  Created by Kevin Chen on 2020/12/10.
//

#import "XYCounterCollectionViewEvent.h"

@implementation XYCounterCollectionViewEvent
- (NSString *)description {
    NSMutableString *string = [[NSMutableString alloc] init];
    [string appendString:@"collectionView ="];
    [string appendString:self.collectionView.description];
    [string appendString:@"\n"];

    [string appendString:@"viewController ="];
    [string appendString:NSStringFromClass(self.viewController.class)];
    [string appendString:@"\n"];
    
    [string appendString:@"collectionViewDelegate ="];
    [string appendString:self.collectionViewDelegate.description];
    [string appendString:@"\n"];
    
    [string appendString:@"indexPath.section ="];
    [string appendString:[NSString stringWithFormat:@"%@",@(self.indexPath.section)]];
    [string appendString:@"\n"];
    
    [string appendString:@"indexPath.item ="];
    [string appendString:[NSString stringWithFormat:@"%@",@(self.indexPath.item)]];
    [string appendString:@"\n"];
    
    return [string copy];
}
@end
