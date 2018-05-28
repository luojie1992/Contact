//
//  NSArray+LJKit.h
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LJKit)

- (id _Nullable )safeObjectAtIndex:(NSInteger)index ;

+ (NSString *_Nullable)arroyToJson:(NSArray *)array  ;

- (nullable id)randomObject;





@end
