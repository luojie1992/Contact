//
//  NSArray+LJKit.m
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import "NSArray+LJKit.h"

@implementation NSArray (LJKit)

- (id _Nullable)safeObjectAtIndex:(NSInteger)index {
    if ([self count] > 0  && [self count] > index ) {
        return [self objectAtIndex:index] ;
    }else {
        return  nil;
    }
    return nil ;
}

+ (NSString *)arroyToJson:(NSArray *)array {
    NSString *json = nil ;
    NSError *error = nil ;
    NSData *data = [NSJSONSerialization dataWithJSONObject:array options:0 error:&error] ;
    if (!error) {
        json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] ;
        return json  ;
    }
    else
        return error.localizedDescription ;
    
}

- (id)randomObject {
    
    if (self.count) {
        return self[arc4random_uniform((uint32_t)self.count) ] ;
    }
    return  nil  ;
}



@end
