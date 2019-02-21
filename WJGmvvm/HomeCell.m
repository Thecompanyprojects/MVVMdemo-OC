//
//  HomeCell.m
//  WJGmvvm
//
//  Created by 王俊钢 on 2019/2/20.
//  Copyright © 2019 wangjungang. All rights reserved.
//

#import "HomeCell.h"

@interface HomeCell()
@property (nonatomic,strong) UILabel *titleLab;
@end

@implementation HomeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.titleLab];
    }
    return self;
}

-(void)setModel:(HomeModel *)Model
{
    if (!Model) {
        Model = [HomeModel init];
    }
    self.titleLab.text = Model.titleStr;
}

#pragma mark - getters

-(UILabel *)titleLab
{
    if(!_titleLab)
    {
        _titleLab = [[UILabel alloc] init];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor blackColor];
        _titleLab.frame = CGRectMake(20, 10, 200, 20);
    }
    return _titleLab;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
