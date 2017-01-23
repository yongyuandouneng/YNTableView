//
//  YNBaseNotDataView.m
//  052_对UITableView_UICollectionView封装
//
//  Created by ZYN on 17/1/22.
//  Copyright © 2017年 Yongneng Zheng. All rights reserved.
//

#import "YNBaseNotDataView.h"

static CGFloat const kViewMargin = 10;
static CGFloat const kLabelMarginX = 10;
@implementation YNBaseNotDataView

- (instancetype)init {
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    
    UIColor *textColor = [UIColor colorWithRed:61/255.0 green:61/255.0 blue:61/255.0 alpha:0.9];
    
    _contentView = [[UIView alloc] init];
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImageView.clipsToBounds = YES;
    _iconImageView.userInteractionEnabled = NO;
    
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.numberOfLines = 0;
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textColor = textColor;
    _contentLabel.userInteractionEnabled = NO;
    
    
    _reloadButton = [[UIButton alloc] init];
    _reloadButton.titleLabel.font = [UIFont systemFontOfSize:14];
    _reloadButton.layer.cornerRadius = 15;
    _reloadButton.layer.borderWidth = 0.8;
    _reloadButton.layer.borderColor = textColor.CGColor;
    [_reloadButton setTitle:@"重新加载" forState:UIControlStateNormal];
    [_reloadButton setTitleColor:textColor forState:UIControlStateNormal];
    [_reloadButton addTarget:self action:@selector(reloadButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_contentView addSubview:_iconImageView];
    [_contentView addSubview:_contentLabel];
    [_contentView addSubview:_reloadButton];
    [self addSubview:_contentView];
    

    
}


- (void)setNotDataViewType:(YNBaseNotDataViewType)notDataViewType {
    
    _notDataViewType = notDataViewType;
    _iconImageView.hidden = YES;
    _contentLabel.hidden = YES;
    _reloadButton.hidden = YES;
    switch (notDataViewType) {
        case YNBaseNotDataViewTypeAll:
        {
            _iconImageView.hidden = NO;
            _contentLabel.hidden = NO;
            _reloadButton.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeImage:
        {
            
            _iconImageView.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeLabel:
        {
            
            _contentLabel.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeButton:
        {
            
            _reloadButton.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeImageAndLabel:
        {
            _iconImageView.hidden = NO;
            _contentLabel.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeImageAndButton:
        {
            _iconImageView.hidden = NO;
            _reloadButton.hidden = NO;
            break;
        }
        case YNBaseNotDataViewTypeLabelAndButton:
        {
            _contentLabel.hidden = NO;
            _reloadButton.hidden = NO;
            break;
        }
    }
    
}
/// 布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat contentHeight = 0;
    CGFloat centerX = self.center.x;
    
    CGFloat subviewTop = 0;
    
    if (!_iconImageView.hidden) {
        CGFloat iconImageViewHeight = _iconImageViewSize.height ?: 100;
        CGFloat iconImageViewWidth = _iconImageViewSize.width ?: 100;
        _iconImageView.frame = CGRectMake(centerX - iconImageViewWidth * 0.5, subviewTop + kViewMargin, iconImageViewWidth, iconImageViewHeight);
        subviewTop = CGRectGetMaxY(_iconImageView.frame);
        contentHeight = subviewTop;
    }
    
    if (!_contentLabel.hidden) {
        
        [_contentLabel sizeToFit];
        
        _contentLabel.frame = CGRectMake(kLabelMarginX, subviewTop + kViewMargin, self.frame.size.width - 2* kLabelMarginX, [self calcuTextHeight]);
        subviewTop = CGRectGetMaxY(_contentLabel.frame);
        contentHeight = subviewTop;

    }
    
    if (!_reloadButton.hidden) {
        
        CGFloat reloadButtonHeight = _reloadButtonSize.height ?: 30;
        CGFloat reloadButtonWidht = _reloadButtonSize.width ?: 80;
        
        _reloadButton.frame = CGRectMake(centerX - reloadButtonWidht * 0.5, subviewTop + kViewMargin, reloadButtonWidht, reloadButtonHeight);
        contentHeight = CGRectGetMaxY(_reloadButton.frame);
        
    }

    _contentView.frame = CGRectMake(0, 0, self.frame.size.width, contentHeight + kViewMargin);
    _contentView.center = CGPointMake(self.center.x, self.center.y + _contentViewOffSetY);
    
    
    if (_allowBackgroundTouch) {
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backgroundTouch)]];
    }
    
}

- (CGFloat)calcuTextHeight {
    
    if (_contentLabel.text.length > 0) {
        return [_contentLabel.text boundingRectWithSize:CGSizeMake(self.frame.size.width - 2* kLabelMarginX, HUGE) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : _contentLabel.font} context:nil].size.height;
    }
    
    if (_contentLabel.attributedText.length > 0) {
       return [_contentLabel.attributedText boundingRectWithSize:CGSizeMake(self.frame.size.width - 2* kLabelMarginX, HUGE) options:NSStringDrawingUsesLineFragmentOrigin context:nil].size.height;
        
    }
    return 0;
    
}

#pragma mark - Actions

- (void)reloadButtonOnClick {
    if (_reloadButtonBlock) {
        _reloadButtonBlock();
    }
    
}
- (void)backgroundTouch {
    if (_backgroundTouchBlock) {
        _backgroundTouchBlock();
    }
    
}



@end
