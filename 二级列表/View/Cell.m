//
//  Cell.m
//  secondList
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "Cell.h"
#import "CellModel.h"
#import "UIView+Extension.h"
@interface Cell ()

@property (nonatomic,weak) UILabel *piCiLabel;

@end
@implementation Cell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *CellID = @"Cell";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[Cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 添加自己可能显示的所有子控件
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *piCiLabel = [[UILabel alloc]init];
        piCiLabel.font = [UIFont systemFontOfSize:14] ;
        piCiLabel.textColor = [UIColor lightGrayColor];
        piCiLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:piCiLabel];
        self.piCiLabel = piCiLabel;
    }
    return self;
}

-(void)setModel:(CellModel *)model
{
    _model = model;
    self.piCiLabel.text = model.content;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.piCiLabel.frame = CGRectMake(20, (self.height - 40)/2, self.width - 25, 40);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
