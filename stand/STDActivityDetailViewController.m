//
//  STDActivityDetailViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/27/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDActivityDetailViewController.h"
#import "STDMenuViewController.h"
#import "UIColor+HexAdditions.h"

@interface STDActivityDetailViewController ()
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@property (nonatomic, strong)UIImage *activityImage;
@end

@implementation STDActivityDetailViewController

- (id)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.activityImage = image;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupHeader];
    
    UIImageView *activityImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height, self.view.frame.size.width, 400)];
    [activityImageView setImage:self.activityImage];
    [self.view addSubview:activityImageView];
    
    UIImageView *placeholderImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.headerView.frame.size.height + activityImageView.frame.size.height, self.view.frame.size.width, 400)];
    [placeholderImageView setImage:[UIImage imageNamed:@"placeholderImage"]];
    [self.view addSubview:placeholderImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupHeader
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                               self.view.frame.size.height *0.1)];
    [self.headerView setBackgroundColor:[UIColor colorWithHexValue:0xededed alpha:0.5f]];
    self.iconButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width*0.2,
                                                                 self.headerView.frame.size.height*0.4)];
    
    [self.iconButton setCenter:self.headerView.center];
    [self.iconButton setBackgroundImage:[UIImage imageNamed:@"icon"] forState:UIControlStateNormal];
    
    self.menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.height*0.5, self.headerView.frame.size.height*0.5)];
    [self.menuButton setCenter:CGPointMake(50, self.headerView.center.y)];
    [self.menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton"] forState:UIControlStateNormal];
    [self.menuButton addTarget:self action:@selector(handleMenuButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.headerView addSubview:self.iconButton];
    [self.headerView addSubview:self.menuButton];
    
    [self.view addSubview:self.headerView];
}

- (void)handleMenuButtonClick
{
    STDMenuViewController *menuViewController = [[STDMenuViewController alloc] init];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:menuViewController animated:NO];
}

@end
