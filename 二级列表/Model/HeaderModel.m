//
//  HeaderModel.m
//  secondList
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "HeaderModel.h"
#import "MJExtension.h"

@implementation HeaderModel
MJCodingImplementation
-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    HeaderModel *model= [HeaderModel mj_objectWithKeyValues:dict];
    self.title = model.title;
    
    NSMutableArray<CellModel *> *muarr = [[NSMutableArray<CellModel *> alloc]init];
    for (NSDictionary *dic in model.cellData) {
        CellModel *mod = [CellModel mj_objectWithKeyValues:dic];
        [muarr addObject:mod];
    }
    self.cellData = muarr;
    return self;
}
@end
