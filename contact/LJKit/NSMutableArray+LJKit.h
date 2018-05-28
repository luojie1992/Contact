//
//  NSMutableArray+LJKit.h
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (LJKit)

typedef void(^sortExchangeCallBack)(id obj1 ,id obj2) ;
typedef NSComparisonResult(^sortComparator)(id obj1 , id obj2) ;

- (void)lj_selecSortWithComparator:(sortComparator)comparatot  didExchange:(sortExchangeCallBack)exExchangeCallBack ;


@end
