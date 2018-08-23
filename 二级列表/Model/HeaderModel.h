//
//  HeaderModel.h
//  secondList
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"
@interface HeaderModel : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,strong) NSArray *cellData;
@end
