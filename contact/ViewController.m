//
//  ViewController.m
//  contact
//
//  Created by jie jie on 2018/5/10.
//  Copyright © 2018年 jie jie. All rights reserved.
//

#import "ViewController.h"
#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>
#import "LJ_locallizedWithDataArray.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
/*! 索引 */
@property (nonatomic, strong) NSMutableArray <NSString *>*indexArray;
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dict = [LJ_locallizedWithDataArray LJ_localizedWithDataArray:self.dataArray localizedNameSEL:@selector(user_Name)];
    self.indexArray   = dict[LJLocalizedIndexArrayKey];
    self.sectionArray = dict[LJLocalizedGroupArrayKey];
    

  //  [self.indexArray insertObject:@"🔍" atIndex:0];
    
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
//    self.tableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.tableView.estimatedRowHeight = 44;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.tableFooterView = [UIView new];
     
        // 更改索引的文字颜色
        //        self.tableView.sectionIndexColor = BAKit_Color_Orange;
        //        self.tableView.sectionIndexTrackingBackgroundColor = BAKit_Color_Red_pod;
        
        [self.view addSubview:self.tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataArray
{
    if(_dataArray == nil)
    {
        _dataArray = @[@"手动法师",
                                @"发生的",
                                @"发送",
                                ];
        
     
    return _dataArray;
  }
    return  nil ;
}

- (NSMutableArray <NSString *> *)indexArray
{
    if(_indexArray == nil)
    {
        _indexArray = [[NSMutableArray <NSString *> alloc] init];
    }
    return _indexArray;
}

- (NSMutableArray *)sectionArray
{
    if(_sectionArray == nil)
    {
        _sectionArray = [[NSMutableArray alloc] init];
    }
    return _sectionArray;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  
        //        return self.searchResultIndexArray.count;
    return 1 ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.dataArray count];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellid" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier ];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row] ;
    cell.backgroundColor  = [UIColor redColor] ;
    return cell;
}

//- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//
//    //    return self.indexArray;
//
//}

@end
