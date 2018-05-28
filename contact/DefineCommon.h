//
//  DefineCommon.h
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#ifndef DefineCommon_h
#define DefineCommon_h


#ifndef __OPTIMIZE__
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...){}
#endif

#pragma mark - weak / strong
#define LJ_WeakSelf        @LJ_Weakify(self);
#define LJ_StrongSelf      @LJ_Strongify(self);

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用self之间的循环引用问题
 * 调用方式: `@LJ_Weakify`实现弱引用转换，`@LJ_Strongify`实现强引用转换
 *
 * 示例：
 * @LJ_Weakify
 * [obj block:^{
 * @strongify_self
 * self.property = something;
 * }];
 */
#ifndef LJ_Weakify
#if DEBUG
#if __has_feature(objc_arc)
#define LJ_Weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define LJ_Weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define LJ_Weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define LJ_Weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

/*！
 * 强弱引用转换，用于解决代码块（block）与强引用对象之间的循环引用问题
 * 调用方式: `@LJ_Weakify(object)`实现弱引用转换，`@LJ_Strongify(object)`实现强引用转换
 *
 * 示例：
 * @LJ_Weakify(object)
 * [obj block:^{
 * @LJ_Strongify(object)
 * strong_object = something;
 * }];
 */
#ifndef LJ_Strongify
#if DEBUG
#if __has_feature(objc_arc)
#define LJ_Strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define LJ_Strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define LJ_Strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define LJ_Strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

/*! 主线程同步队列 */
#define dispatch_main_sync_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}
/*! 主线程异步队列 */
#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#pragma mark - runtime
/*! runtime set */
#define LJ_Objc_setObj(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

/*! runtime setCopy */
#define LJ_Objc_setObjCOPY(key, value) objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_COPY)

/*! runtime get */
#define LJ_Objc_getObj objc_getAssociatedObject(self, _cmd)

/*! runtime exchangeMethod */
#define LJ_Objc_exchangeMethodAToB(methodA,methodB) method_exchangeImplementations(class_getInstanceMethod([self class], methodA), class_getInstanceMethod([self class], methodB));

/*! 懒加载 */
#define LJ_Lazy(object, assignment) (object = object ?: assignment)


#pragma mark - NotiCenter
#define LJ_NotiCenter [NSNotificationCenter defaultCenter]

#define LJ_NSUserDefaults [NSUserDefaults standardUserDefaults]

/*! 获取sharedApplication */
#define LJ_SharedApplication    [UIApplication sharedApplication]



/*! 用safari打开URL */
#define LJ_OpenUrl(urlStr)      [LJ_SharedApplication openURL:[NSURL URLWithString:urlStr]]

/*! 复制文字内容 */
#define LJ_CopyContent(content) [[UIPasteboard generalPasteboard] setString:content]

#pragma mark 从本地文件读取数据
/*!
 从本地文件读取数据
 
 @param fileName 文件名
 @param type type 类型
 @return data
 */
CG_INLINE NSData *
LJ_GetDataWithContentsOfFile(NSString *fileName, NSString *type){
    return [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
}

#pragma mark json 解析 data 数据
/*!
 json 解析 data 数据
 
 @param data 需要解析的 data
 @return NSDictionary
 */
CG_INLINE NSDictionary *
LJ_GetDictionaryWithData(NSData *data){
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark json 解析 ，直接从本地文件读取 json 数据，返回 NSDictionary
/*!
 json 解析 data 数据
 
 @param fileName 文件名
 @param type type 类型
 @return NSDictionary
 */
CG_INLINE NSDictionary *
LJ_GetDictionaryWithContentsOfFile(NSString *fileName, NSString *type){
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:type]];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

#pragma mark - color
CG_INLINE UIColor *
LJ_Color_RGBA_pod(u_char r,u_char g, u_char b, u_char a) {
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

CG_INLINE UIColor *
LJ_Color_RGB_pod(u_char r,u_char g, u_char b) {
    return BAKit_Color_RGBA_pod(r, g, b, 1.0);
}

CG_INLINE UIColor *
LJ_Color_RGBValue_pod(UInt32 rgbValue){
    return [UIColor colorWithRed:((rgbValue & 0xff0000) >> 16) / 255.0f
                           green:((rgbValue & 0xff00) >> 8) / 255.0f
                            blue:(rgbValue  & 0xff) / 255.0f
                           alpha:1.0f];
}

CG_INLINE UIColor *
LJ_Color_RGBAValue_pod(UInt32 rgbaValue){
    return [UIColor colorWithRed:((rgbaValue & 0xff000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xff0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xff00) >> 8) / 255.0f
                           alpha:(rgbaValue  & 0xff) / 255.0f];
}

#endif /* DefineCommon_h */
