//
//  ARCHDefaultMenuView.h
//  Arch
//
//  Created by Adithya Ravikumar on 4/5/14.
//  Copyright (c) 2014 Arch. All rights reserved.
//

@interface STDDefaultMenuView : UIView

@property (nonatomic, strong, readonly)UIButton *swipeButton;
@property (nonatomic, strong, readonly)UIButton *talkButton;
@property (nonatomic, strong, readonly)UIButton *Explore;
@property (nonatomic, strong, readonly)UIButton *checkUpButton;
@property (nonatomic, strong, readonly)UIButton *settings;

- (void)layoutItems;

@end
