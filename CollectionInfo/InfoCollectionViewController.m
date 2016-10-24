//
//  ViewController.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "InfoCollectionViewController.h"

@interface InfoCollectionViewController ()<UITableViewDelegate, UITableViewDataSource,sendMessageDelegate>
@property(nonatomic, strong)NSString *line;
@property(nonatomic, strong)NSString *lines;
@property(nonatomic, strong)NSString *date;
@property(nonatomic, strong)NSString *oneSelect;
@property(nonatomic, strong)NSString *MutiSelect;
@property(nonatomic, strong)NSMutableArray *infoArr;
@end

@implementation InfoCollectionViewController
-(NSMutableArray *)infoArr{
    if (_infoArr == nil) {
        _infoArr = [[NSMutableArray alloc]init];
    }
    return _infoArr;
}
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
    
    ZHMessage *message1_1 = [[ZHMessage alloc]init];
    ZHMessage *message2_1 = [[ZHMessage alloc]init];
    ZHMessage *message3_1 = [[ZHMessage alloc]init];
    ZHMessage *message4_1 = [[ZHMessage alloc]init];
    ZHMessage *message5_1 = [[ZHMessage alloc]init];
    message1.title = @"单行";
    message1.ID = 1;
    message1.cellType = ZHCellTypeline;
    message2.title = @"多行";
    message2.cellType = ZHCellTypeMutiLines;
    message2.ID = 2;
    message3.title = @"日期";
    message3.ID = 3;
    message3.cellType = ZHCellTypeDate;
    message4.title = @"单选";
    message4.ID = 4;
    message4.cellType = ZHCellTypeOneS;
    message5.title = @"多选";
    message5.cellType = ZHCellTypeMutilS;
    message5.ID = 5;
    message1_1.title = @"单行";
    message1_1.ID = 6;
    message1_1.cellType = ZHCellTypeline;
    message2_1.title = @"多行";
    message2_1.ID = 7;
    message2_1.cellType = ZHCellTypeMutiLines;
    message3_1.title = @"日期";
    message3_1.ID = 8;
    message3_1.cellType = ZHCellTypeDate;
    message4_1.title = @"单选";
    message4_1.ID = 9;
    message4_1.cellType = ZHCellTypeOneS;
    message5_1.title = @"多选";
    message5_1.ID = 10;
    message5_1.cellType = ZHCellTypeMutilS;
    
    
    _collection = [[Collection alloc]init];

    _arr = [NSMutableArray array];
    [_arr addObject:message1];
    [_arr addObject:message2];
    [_arr addObject:message3];
    [_arr addObject:message4];
    [_arr addObject:message5];
    
    [_arr addObject:message1_1];
    [_arr addObject:message2_1];
    [_arr addObject:message3_1];
    [_arr addObject:message4_1];
    [_arr addObject:message5_1];
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
        [self.infoArr addObject:dic];
//    if ([dic.allKeys[0] isEqualToString:@"line"]) {
//        
//        NSLog(@"单行：%@",dic.allValues[0]);
//        self.line =dic.allValues[0];
//    }else if ([dic.allKeys[0] isEqualToString:@"lines"]){
//        NSLog(@"多行：%@",dic.allValues[0]);
//        self.line =dic.allValues[0];
//        //日期
//    }else if ([dic.allValues[0] isEqualToString:@"date"]){
//        self.date = dic.allValues[0];
//    }
//    }else{
//        
//    }
    }
}

-(void)poptoItem:(NSNotification *)notice{
    //单选
    NSDictionary *dic = notice.userInfo;
    NSString *IDstr = [dic objectForKey:@"ID"];
    SelectItemTableViewController *vc = [[SelectItemTableViewController alloc]init];
    vc.ID = IDstr.integerValue;
    [vc returnMsg:^(NSDictionary *msgdic) {
        NSLog(@"%@",msgdic);
//        self.oneSelect = msg;
        [self.infoArr addObject:msgdic];
        [self.tableview reloadData];
    
    }];
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(void)poptoItems:(NSNotification *)notic{
    //多选
    NSDictionary *dic = notic.userInfo;
    NSString *IDstr = [dic objectForKey:@"ID"];
    SelectItemsTableViewController *vc = [[SelectItemsTableViewController alloc]init];
    vc.ID = IDstr.integerValue;
    [vc returnMsgs:^(NSDictionary *msgdic) {
//        self.MutiSelect = [arr componentsJoinedByString:@","];
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
