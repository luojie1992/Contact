//
//  NSObject+LJRuntime.h
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LJRuntime)

/**
 字典数组转化为模型数组

 @param array 字典数组
 @return 模型对象数组
 */
+ (NSArray *)lJ_objectsWithArray:(NSArray *)array ;

+ (NSArray *)LJ_propertysList ;

+ (NSArray *)LJ_ivarList ;

+ (NSArray *)LJ_methodList ;

+ (NSArray *)LJ_protocolList ;



@end
