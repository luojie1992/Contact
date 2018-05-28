//
//  LJ_locallizedWithDataArray.h
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*! 索引 */
#define LJLocalizedIndexArrayKey @"LJLocalizedIndexArrayKey"
/*! 排序后的分组，可以为 model */
#define LJLocalizedGroupArrayKey @"LJLocalizedGroupArrayKey"

@interface LJ_locallizedWithDataArray : NSObject


+ (NSDictionary *)LJ_localizedWithDataArray:(NSMutableArray *)dataArray
                           localizedNameSEL:(SEL)localizedNameSEL;


@end
