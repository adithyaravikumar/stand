//
//  STDActivityDisplayCell.m
//  stand
//
//  Created by Adithya Ravikumar on 4/26/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDActivityDisplayCell.h"

@interface STDActivityDisplayCell()
@property (nonatomic, strong)UIButton *infoButton;
@property (nonatomic, strong)UIButton *tickButton;
@end

@implementation STDActivityDisplayCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setupCellWithDisplayImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.contentView.frame];
    [imageView setImage:image];
    
    self.tickButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-150, self.contentView.frame.size.height-50, 30, 30)];
     self.infoButton = [[UIButton alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width-80, self.contentView.frame.size.height-50, 30, 30)];
    
    [self.tickButton setBackgroundImage:[UIImage imageNamed:@"tick"] forState:UIControlStateNormal];
    [self.infoButton setBackgroundImage:[UIImage imageNamed:@"info"] forState:UIControlStateNormal];
    
    [self.tickButton setAlpha:0.7f];
    [self.infoButton setAlpha:0.7f];
    
    [self.contentView addSubview:imageView];
    [self.contentView addSubview:self.tickButton];
    [self.contentView addSubview:self.infoButton];
}

@end
