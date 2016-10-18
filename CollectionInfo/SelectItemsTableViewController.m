//
//  SelectItemsTableViewController.h
//  CollectionInfo
//
//  Created by 甄翰宏 on 2016/10/14.
//  Copyright © 2016年 Makermeet. All rights reserved.
//
#import "SelectItemsTableViewController.h"

@interface SelectItemsTableViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@property(nonatomic, strong)NSMutableDictionary *seletedDic;
@property (nonatomic, assign) BOOL isAllSelected;

@end

@implementation SelectItemsTableViewController
-(NSMutableDictionary *)seletedDic{
    if (_seletedDic == nil) {
        _seletedDic = [NSMutableDictionary dictionary];
    }
    return _seletedDic;
}
- (NSArray *)dataArray {
    
    if (_dataArray == nil) {
        
        _dataArray = @[@"Mars",
                       @"gogoing",
                       @"TableView",
                       @"runtime",
                       @"blackMagic",
                       @"CSDN",
                       @"This",
                       @"Swift"];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"多选";
    
    [self customTableView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(selecteAllCells:)];
    
}


#pragma mark Actions
- (void)selecteAllCells:(UIBarButtonItem *)sender {
    NSArray *arr = self.seletedDic.allKeys;
    if (_returnMsgsBock != nil) {
        self.returnMsgsBock(arr);
    }
    [self.navigationController popViewControllerAnimated:YES];
  
}

#pragma mark UI

- (void)customTableView {
    self.tableView.editing = YES;
    self.tableView.allowsMultipleSelectionDuringEditing = YES;
    
}


#pragma mark <UITableDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseID = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.selectedBackgroundView = [[UIView alloc] init];
    
    
    return cell;
}

#pragma mark <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.seletedDic setObject:indexPath forKey:self.dataArray[indexPath.item]];

}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.seletedDic removeObjectForKey:[self.dataArray objectAtIndex:indexPath.item]];
    
}
-(void)returnMsgs:(ReturnMsgs)returnmsgs{
    self.returnMsgsBock = returnmsgs;
}


@end
