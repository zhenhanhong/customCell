//
//  ViewController.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,sendMessageDelegate>
@property(nonatomic, strong)NSString *line;
@property(nonatomic, strong)NSString *lines;
@property(nonatomic, strong)NSString *date;
@property(nonatomic, strong)NSString *oneSelect;
@property(nonatomic, strong)NSString *MutiSelect;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"报名信息";
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 64) style:UITableViewStylePlain];
    _tableview.backgroundColor = [SetColor colorWithHexString:@"#EFEFF4"];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.userInteractionEnabled = YES;
    UITapGestureRecognizer *recog = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resignresponse)];
    [_tableview addGestureRecognizer:recog];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableview registerClass:[ZHCellTypeliner class] forCellReuseIdentifier:@"onelinecell"];
    [_tableview registerClass:[ZHCellTypeMutiLinesr class] forCellReuseIdentifier:@"mutilinecell"];
    [_tableview registerClass:[ZHCellTypeDater class] forCellReuseIdentifier:@"datecell"];
    [_tableview registerClass:[ZHCellTypeOneSelect class] forCellReuseIdentifier:@"oneselectcell"];
    [_tableview registerClass:[ZHCellTypeMutilSelect class] forCellReuseIdentifier:@"mutilselectcell"];
    [self.view addSubview:_tableview];
    
    //测试数据
    ZHMessage *message1 = [[ZHMessage alloc]init];
    ZHMessage *message2 = [[ZHMessage alloc]init];
    ZHMessage *message3 = [[ZHMessage alloc]init];
    ZHMessage *message4 = [[ZHMessage alloc]init];
    ZHMessage *message5 = [[ZHMessage alloc]init];
    message1.title = @"单行";
    message1.cellType = ZHCellTypeline;
    message2.title = @"多行";
    message2.cellType = ZHCellTypeMutiLines;
    message3.title = @"日期";
    message3.cellType = ZHCellTypeDate;
    message4.title = @"单选";
    message4.cellType = ZHCellTypeOneS;
    message5.title = @"多选";
    message5.cellType = ZHCellTypeMutilS;
    _collection = [[Collection alloc]init];

    _arr = [NSMutableArray array];
    [_arr addObject:message1];
    [_arr addObject:message2];
    [_arr addObject:message3];
    [_arr addObject:message4];
    [_arr addObject:message5];
    /*******************************************************/
    
    //监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(poptoItem) name:@"item" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(poptoItems) name:@"items" object:nil];
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

     ZHMessage *message = [[ZHMessage alloc]init];
    message = _arr[indexPath.item];
    message.oneseletStr = self.oneSelect;
    message.mutilseletStr = self.MutiSelect;
    id cell = [tableView dequeueReusableCellWithIdentifier:message.cellIndentify forIndexPath:indexPath];
    [cell setDelegate:self];
    [cell setZhmessage:message];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZHMessage *message = [_arr objectAtIndex:indexPath.item];
    return message.cellHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}
//接收所有message msg类型自定义
-(void)sendMessageWithDic:(NSDictionary *)dic{
    if(dic != nil){
    if ([dic.allKeys[0] isEqualToString:@"line"]) {
        
        NSLog(@"单行：%@",dic.allValues[0]);
        self.line =dic.allValues[0];
    }else if ([dic.allKeys[0] isEqualToString:@"lines"]){
        NSLog(@"多行：%@",dic.allValues[0]);
        self.line =dic.allValues[0];
        //日期
    }else if ([dic.allValues[0] isEqualToString:@"date"]){
        self.date = dic.allValues[0];
    }
    }else{
        
    }
}

-(void)poptoItem{
    //单选
    SelectItemTableViewController *vc = [[SelectItemTableViewController alloc]init];
    [vc returnMsg:^(NSString *msg) {
        NSLog(@"%@",msg);
        self.oneSelect = msg;
        [self.tableview reloadData];
    
    }];
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(void)poptoItems{
    //多选
    SelectItemsTableViewController *vc = [[SelectItemsTableViewController alloc]init];
    [vc returnMsgs:^(NSArray *arr) {
        self.MutiSelect = [arr componentsJoinedByString:@","];
        [self.tableview reloadData];
    }];
    [self.navigationController pushViewController:vc animated:NO];
}
//回收键盘
-(void)resignresponse{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"recall" object:nil];
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"item" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"items" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
