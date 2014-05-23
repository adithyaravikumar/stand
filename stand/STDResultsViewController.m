//
//  STDResultsViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/26/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDResultsViewController.h"
#import "STDMenuViewController.h"
#import "UIColor+HexAdditions.h"

@interface STDResultsViewController ()
@property NSInteger emotionIndexValue;
@property (nonatomic, strong)UILabel *moodTitle;
@property (nonatomic, strong)UIImageView *thermometerView;
@property (nonatomic, strong)UILabel *description;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@end

@implementation STDResultsViewController

- (id)initWithEmotionIndex:(NSInteger)emotionIndex
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.emotionIndexValue = emotionIndex;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupHeader];
    
    self.moodTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 100)];
    [self.moodTitle setCenter:CGPointMake(self.view.center.x, 150)];
    [self.moodTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:32.0f]];
    [self.moodTitle setTextColor:[UIColor lightGrayColor]];
    [self.moodTitle setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.moodTitle];
    
    self.thermometerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 650)];
    [self.thermometerView setCenter:self.view.center];
    [self.view addSubview:self.thermometerView];
    
    self.description = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 500, 100)];
    [self.description setCenter:CGPointMake(self.view.center.x, 900)];
    [self.description setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:20.0f]];
    [self.description setTextColor:[UIColor lightGrayColor]];
    [self.description setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.description];
    
    if(self.emotionIndexValue < 6)
    {
        [self.thermometerView setImage:[UIImage imageNamed:@"thermometerDepressed"]];
        [self.moodTitle setText:@"You need help!"];;
        [self.description setText:@"You can start by speaking with one of our specialists."];
    }
    else if(self.emotionIndexValue < 12)
    {
        [self.thermometerView setImage:[UIImage imageNamed:@"thermometerAnxious"]];
        [self.moodTitle setText:@"You can lift up your spirits today"];
        [self.description setText:@"Try out one of our challenges."];
    }
    else
    {
        if(self.emotionIndexValue == 100)
        {
            [self.thermometerView setImage:[UIImage imageNamed:@"thermometerNothing"]];
            [self.moodTitle setText:@"Hey there!"];
            [self.description setText:@"Swipe our flash cards to assess your mood scale"];
        }
        else
        {
            [self.thermometerView setImage:[UIImage imageNamed:@"thermometerPerfect"]];
            [self.moodTitle setText:@"You're shipshape!"];
            [self.description setText:@"Your mood scale is awesome today!"];
        }
    }
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
