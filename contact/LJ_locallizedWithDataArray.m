//
//  LJ_locallizedWithDataArray.m
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import "LJ_locallizedWithDataArray.h"

@implementation LJ_locallizedWithDataArray

+ (NSDictionary *)LJ_localizedWithDataArray:(NSMutableArray *)dataArray
                           localizedNameSEL:(SEL)localizedNameSEL
{
    /*! 对数组重建索引，按照abcd字母顺序进行分组 */
    UILocalizedIndexedCollation *indexCollation = [UILocalizedIndexedCollation currentCollation];
    NSInteger index, sectionTitlesCount = [[indexCollation sectionTitles] count];
    NSMutableArray *indexArray = [[NSMutableArray alloc] initWithArray:[indexCollation sectionTitles]];
    
    /*! 临时数据，存放 section 对应的 userObjc 数组数据 */
    NSMutableArray *newSectionsArray = [[NSMutableArray alloc] initWithCapacity:sectionTitlesCount];
    
    /*! 设置sections数组初始化：元素包含userObjs数据的空数据 */
    for (index = 0; index < sectionTitlesCount; index++)
    {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [newSectionsArray addObject:array];
    }
    
    /*! 分组 */
    for (id object in dataArray)
    {
//        /*! 根据timezone的localename，获得对应的的section number */
//        NSInteger sectionNumber = [indexCollation sectionForObject:object collationStringSelector:localizedNameSEL];
//        /*! 根据sectionNumber获取数组 */
//       NSMutableArray *sectionUserObjs = [newSectionsArray objectAtIndex:sectionNumber];
//        /*! 添加对象到对应的数组中 */
//        [sectionUserObjs addObject:object];
    }
    
//    /*! 获取空的数组的index */
//    NSMutableArray *willDeleteAry = [NSMutableArray new];
//    for (int i = 0; i < newSectionsArray.count; i ++)
//    {
//        NSArray *tempAry = newSectionsArray[i];
//        if (tempAry.count == 0) {
//            [willDeleteAry addObject:[NSString stringWithFormat:@"%d",i]];
//        }
//    }
//
//    /*! 删除空的数组 */
//    for (NSInteger i = willDeleteAry.count; i > 0; i -- )
//    {
//        NSInteger index = [willDeleteAry[i - 1] integerValue];
//        [newSectionsArray removeObjectAtIndex:index];
//        [indexArray removeObjectAtIndex:index];
//    }
    
    /*! 该字典中存放分组排序呢后的索引及数据 */
    NSDictionary *dict = @{LJLocalizedGroupArrayKey : dataArray,
                           LJLocalizedIndexArrayKey : indexArray};
    
    return dict;
}

@end
