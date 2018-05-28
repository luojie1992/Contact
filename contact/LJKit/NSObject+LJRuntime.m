//
//  NSObject+LJRuntime.m
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import "NSObject+LJRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (LJRuntime)

+ (NSArray *)lJ_objectsWithArray:(NSArray *)array {
    if (array.count  == 0 ) {
        return nil ;
    }
    
    NSAssert([array[0] isKindOfClass:[NSDictionary class] ], @"it is right ")  ;
    NSArray *propertyList = [self LJ_propertysList] ;
    NSMutableArray *arrayM = [NSMutableArray array] ;
    for (NSDictionary *dict in array) {
        id model =  [self new] ;
        for (NSString *key in dict) {
            if ([propertyList containsObject:key]) {
                [model setValue:dict[key] forKey:key] ;
            }
        }
        
        [arrayM addObject:model] ;
    }
    return  [arrayM copy] ;
}

const void *LJ_propertyListKey = @"lJ_propertyListKey" ;
+ (NSArray *)LJ_propertysList {
    NSArray *result = objc_getAssociatedObject(self, LJ_propertyListKey) ;
    if (result != NULL) {
        return  result ;
    }
    NSMutableArray *arrayM  = [NSMutableArray array] ;
   unsigned int count = 0 ;
    objc_property_t *list = class_copyPropertyList([self class], &count) ;
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t property = list[i] ;
        const char *cName = property_getName(property) ;
        NSString *name = [NSString stringWithUTF8String:cName] ;
        [arrayM addObject:name] ;
        
    }
    free(list) ;
    objc_setAssociatedObject(self, LJ_propertyListKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC) ;
    return  objc_getAssociatedObject(self, LJ_propertyListKey) ;
    

}

const void *lj_methodListKey = @"lj_methodListKey" ;

+ (NSArray *)LJ_methodList {
    NSArray *methodList  = objc_getAssociatedObject(self, lj_methodListKey) ;
    if (methodList != nil) {
        return methodList ;
    }
    
    unsigned int count = 0  ;
    Method *list = class_copyMethodList([self class], &count)  ;
    NSMutableArray *arrayM = [NSMutableArray array] ;
    for (unsigned int i = 0; i < count ; i ++ ) {
        Method method = list[i] ;
        SEL methodName = method_getName(method) ;
        NSString *methodName_OC = NSStringFromSelector(methodName) ;
        [arrayM addObject:methodName_OC] ;
        const char *name_s = sel_getName(method_getName(method)) ;
        int arguments = method_getNumberOfArguments(method) ;
        NSLog(@"%@%d",name_s,arguments) ;
    }
    free(list) ;
    objc_setAssociatedObject(self, lj_methodListKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC) ;
    return objc_getAssociatedObject(self, lj_methodListKey) ;
    
}

const void *lj_ivarListKey = @"lj_ivarListKey" ;
+ (NSArray *)LJ_ivarList {
    NSArray *ivarList  = objc_getAssociatedObject(self, lj_ivarListKey) ;
    if (ivarList !=nil) {
        return ivarList;
        
    }
    unsigned int count = 0 ;
    Ivar *ivars =  class_copyIvarList([self class], &count) ;
    NSMutableArray *arrayM  = [NSMutableArray array] ;
    for (unsigned int i = 0 ; i < count; i ++ ) {
        Ivar ivar = ivars[i] ;
        const char *ivarName =  ivar_getName(ivar) ;
        NSString *ivarSName = [NSString stringWithUTF8String:ivarName] ;
        [arrayM addObject:ivarSName] ;
    }
    free(ivars) ;
    objc_setAssociatedObject(self, lj_ivarListKey, arrayM, OBJC_ASSOCIATION_COPY_NONATOMIC) ;
    return  objc_getAssociatedObject(self, lj_ivarListKey) ;
    return nil ;
}


























@end
