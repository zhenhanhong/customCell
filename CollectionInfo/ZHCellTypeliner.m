//
//  ZHCellTypeline.m
//  CollectionInfo
//
//  Created by Zhen hanhong on 16/10/13.
//  Copyright © 2016年 Makermeet. All rights reserved.
//

#import "ZHCellTypeline.h"

@implementation ZHCellTypeline
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self addSubview:self.textfield];
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    
}
-(void)setTextfield:(UITextField *)textfield{
    
}

@end
