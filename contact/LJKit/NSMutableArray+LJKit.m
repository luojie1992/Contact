//
//  NSMutableArray+LJKit.m
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import "NSMutableArray+LJKit.h"

@implementation NSMutableArray (LJKit)

- (void)lj_selecSortWithComparator:(sortComparator)comparatot didExchange:(sortExchangeCallBack)exExchangeCallBack {
    
    if (self.count == 0 ) {
        return ;
    }
    
    for (NSInteger i= 0 ; i < self.count; i++) {
        for (NSInteger j = 0; j < self.count; j ++) {
            if (comparatot(self[i],self[j]) == NSOrderedDescending) {
                
            }
        }
    }
    
}
@end
