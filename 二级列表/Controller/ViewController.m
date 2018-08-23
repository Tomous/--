//
//  ViewController.m
//  二级列表
//
//  Created by 大橙子 on 2018/6/19.
//  Copyright © 2018年 中都格罗唯视. All rights reserved.
//

#import "ViewController.h"
#import "HeaderModel.h"
#import "Cell.h"
#import "CellModel.h"
#import "HeaderView.h"
@interface ViewController ()
<UITableViewDelegate,UITableViewDataSource,HeaderViewDelegate>
{
    int _currentRow;
    int _currentSection;
}
@property (nonatomic, strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray * headViewArray;
@property (nonatomic,strong) NSMutableArray *data;
@end

@implementation ViewController

-(NSMutableArray *)data
{
    if (!_data) {
        _data = [NSMutableArray array];
    }
    return _data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *data = @[@{
                          @"title":@"世上事仿佛都经不起后来的推敲",
                          @"cellData":@[@{
                                            @"content":@"诸如，后来你变了"
                                            },
                                        @{
                                            @"content":@"后来我卷了"
                                            }]
                          },
                      @{
                          @"title":@"后来故人零落",
                          @"cellData":@[@{
                                            @"content":@"新人款款前来"
                                            },
                                        @{
                                            @"content":@"后来时光静默"
                                            },
                                        @{
                                            @"content":@"过往逆流成河"
                                            }]
                          },
                      @{
                          @"title":@"模糊的青天雨落",
                          @"cellData":@[@{
                                            @"content":@"遗失的年少轻彻"
                                            },@{
                                            @"content":@"此去的别后经年"
                                            },
                                        @{
                                            @"content":@"他乡的阁楼冷彻"
                                            }]
                          },
                      @{
                          @"title":@"我还倚着些微的坚强",
                          @"cellData":@[@{
                                            @"content":@"却已背离曾经的方向"
                                            },
                                        @{
                                            @"content":@"半盏酒后"
                                            },
                                        @{
                                            @"content":@"便是遗忘"
                                            }]
                          }];
    
    self.data = [HeaderModel mj_objectArrayWithKeyValuesArray:data];
    
    
    self.headViewArray = [NSMutableArray array];
    int i = 0;
    for (HeaderModel *model in self.data) {
        HeaderView *headerView = [[HeaderView alloc]init];
        headerView.headerModel = model;
        headerView.delegate = self;
        headerView.index = i;
        i++;
        [self.headViewArray addObject:headerView];
    }
    
    
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 10, self.view.width, self.view.height - 20) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return self.headViewArray[section];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    HeaderView* headView = self.headViewArray[section];
    HeaderModel *headerModel = self.data[section];
    return headView.open?headerModel.cellData.count:0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.headViewArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [Cell cellWithTableView:tableView];
    HeaderModel *headerModel = self.data[indexPath.section];
    CellModel *model = headerModel.cellData[indexPath.row];
    cell.model = model;
    return cell;
}
-(CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 50;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"click---%ld section and %ld row",(long)indexPath.section,(long)indexPath.row);
}
#pragma mark - HeadViewdelegate
-(void)selectedWith:(HeaderView *)view{
    _currentRow = -1;
    if (view.open) {
        for(int i = 0;i<[self.headViewArray count];i++)
        {
            HeaderView *head = [self.headViewArray objectAtIndex:i];
            head.open = NO;
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                head.backBtn.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);
            } completion:NULL];
        }
        [_tableView reloadData];
        return;
    }
    _currentSection = (int)view.index;
    [self reset];
}
//界面重置
- (void)reset
{
    for(int i = 0;i<[self.headViewArray count];i++)
    {
        HeaderView *head = [self.headViewArray objectAtIndex:i];
        if(head.index == _currentSection)
        {
            head.open = YES;
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                head.backBtn.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
            } completion:NULL];
        }else {
            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
                head.backBtn.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1);
            } completion:NULL];
            head.open = NO;
        }
    }
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
