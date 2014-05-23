//
//  ARCHDefaultMenuView.m
//  Arch
//
//  Created by Adithya Ravikumar on 4/5/14.
//  Copyright (c) 2014 Arch. All rights reserved.
//

#import "STDDefaultMenuView.h"

@interface STDDefaultMenuView()

@property (nonatomic, strong)UIButton *swipeButton;
@property (nonatomic, strong)UIButton *talkButton;
@property (nonatomic, strong)UIButton *exploreButton;
@property (nonatomic, strong)UIButton *checkUpButton;
@property (nonatomic, strong)UIButton *settings;

@end

@implementation STDDefaultMenuView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
        self.swipeButton = [[UIButton alloc] init];
        self.talkButton = [[UIButton alloc] init];
        self.exploreButton = [[UIButton alloc] init];
        self.checkUpButton = [[UIButton alloc] init];
        self.settings = [[UIButton alloc] init];
        
        [self setupAttributesForButton:self.swipeButton ofType:@"Swipe"];
        [self setupAttributesForButton:self.talkButton ofType:@"Talk"];
        [self setupAttributesForButton:self.exploreButton ofType:@"Explore"];
        [self setupAttributesForButton:self.checkUpButton ofType:@"Check Up"];
        [self setupAttributesForButton:self.settings ofType:@"Settings"];
        
        [self addSubview:self.swipeButton];
        [self addSubview:self.talkButton];
        [self addSubview:self.exploreButton];
        [self addSubview:self.checkUpButton];
        [self addSubview:self.settings];
    }
    return self;
}

- (void)layoutItems
{
    [self.swipeButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.talkButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.exploreButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.checkUpButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.settings setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    //SEARCH Button
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.swipeButton
                              attribute:NSLayoutAttributeCenterX
                              relatedBy:NSLayoutRelationEqual
                              toItem:self
                              attribute:NSLayoutAttributeCenterX
                              multiplier:1.0
                              constant:0.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.swipeButton
                              attribute:NSLayoutAttributeCenterY
                              relatedBy:NSLayoutRelationEqual
                              toItem:self
                              attribute:NSLayoutAttributeTop
                              multiplier:1.0
                              constant:30.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.swipeButton
                              attribute:NSLayoutAttributeWidth
                              relatedBy:NSLayoutRelationEqual
                              toItem:self
                              attribute:NSLayoutAttributeWidth
                              multiplier:1.0
                              constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                              constraintWithItem:self.swipeButton
                              attribute:NSLayoutAttributeHeight
                              relatedBy:NSLayoutRelationEqual
                              toItem:self
                              attribute:NSLayoutAttributeHeight
                              multiplier:0.1
                              constant:0.0]];
    
    //COLLECTION Button
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.talkButton
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.talkButton
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.swipeButton
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:30.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.talkButton
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.talkButton
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
    
    //PLAYLIST Button
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.exploreButton
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.exploreButton
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.talkButton
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:30.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.exploreButton
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.exploreButton
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
    
    //LYRICS Button
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkUpButton
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkUpButton
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.exploreButton
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:30.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkUpButton
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.checkUpButton
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
    
    //SETTINGS Button
    
    //CenterX Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.settings
                         attribute:NSLayoutAttributeCenterX
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeCenterX
                         multiplier:1.0
                         constant:0.0]];
    
    //CenterY Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.settings
                         attribute:NSLayoutAttributeCenterY
                         relatedBy:NSLayoutRelationEqual
                         toItem:self.checkUpButton
                         attribute:NSLayoutAttributeBottom
                         multiplier:1.0
                         constant:30.0]];
    
    //Width Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.settings
                         attribute:NSLayoutAttributeWidth
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeWidth
                         multiplier:1.0
                         constant:0.0]];
    
    //Height Constraint
    [self addConstraint:[NSLayoutConstraint
                         constraintWithItem:self.settings
                         attribute:NSLayoutAttributeHeight
                         relatedBy:NSLayoutRelationEqual
                         toItem:self
                         attribute:NSLayoutAttributeHeight
                         multiplier:0.1
                         constant:0.0]];
}

- (void)setupAttributesForButton:(UIButton *)button ofType:(NSString *)title
{
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
}

@end
