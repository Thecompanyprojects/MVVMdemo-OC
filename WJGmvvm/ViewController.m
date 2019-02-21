//
//  ViewController.m
//  WJGmvvm
//
//  Created by 王俊钢 on 2019/2/20.
//  Copyright © 2019 wangjungang. All rights reserved.
//

#import "ViewController.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "HomeViewModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

static NSString *identfity = @"identfity";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.table];
    self.table.tableFooterView = [UIView new];
    self.dataSource = [NSMutableArray new];
    HomeViewModel *vm = [[HomeViewModel alloc] init];
    [vm headerRefreshRequestWithCallback:^(NSArray * _Nonnull array) {
        self.dataSource = (NSMutableArray *)array;
        [self.table reloadData];
    }];
}

#pragma mark - getters

-(UITableView *)table
{
    if(!_table)
    {
        _table = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _table.dataSource = self;
        _table.delegate = self;
    }
    return _table;
}

#pragma mark - UITableViewDataSource&&UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count?:0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:identfity];
    cell = [[HomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfity];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.Model = self.dataSource[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
