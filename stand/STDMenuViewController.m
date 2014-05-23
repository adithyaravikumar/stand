//
//  STDMenuViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/26/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDMenuViewController.h"
#import "STDCardSwipeViewController.h"
#import "STDActivitiesViewController.h"
#import "STDResultsViewController.h"
#import "STDTalkViewController.h"

@interface STDMenuViewController ()
@property (nonatomic, strong)UIButton *homeButton;
@property (nonatomic, strong)UIButton *talkButton;
@property (nonatomic, strong)UIButton *exploreButton;
@property (nonatomic, strong)UIButton *checkUpButton;
@property (nonatomic, strong)UIButton *settingsButton;
@end

@implementation STDMenuViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [icon setCenter:CGPointMake(self.view.center.x, self.view.center.y - 300)];
    [icon setImage:[UIImage imageNamed:@"standing"]];
    [self.view addSubview:icon];
    
    self.homeButton = [[UIButton alloc] initWithFrame:CGRectMake(284, 312, 200, 100)];
    self.talkButton = [[UIButton alloc] initWithFrame:CGRectMake(284, 412, 200, 100)];
    self.exploreButton = [[UIButton alloc] initWithFrame:CGRectMake(284, 512, 200, 100)];
    self.checkUpButton = [[UIButton alloc] initWithFrame:CGRectMake(284, 612, 200, 100)];
    self.settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(284, 712, 200, 100)];
    
    [self setupButton:self.homeButton withCaption:@"Home"];
    [self setupButton:self.talkButton withCaption:@"Talk"];
    [self setupButton:self.exploreButton withCaption:@"Explore"];
    [self setupButton:self.checkUpButton withCaption:@"Check Up"];
    [self setupButton:self.settingsButton withCaption:@"Settings"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.homeButton addTarget:self action:@selector(handleCardSwipeButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.exploreButton addTarget:self action:@selector(handleExploreButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.checkUpButton addTarget:self action:@selector(handleResultsButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.talkButton addTarget:self action:@selector(handleTalkButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupButton:(UIButton *)button withCaption:(NSString *)caption
{
    [button setTitle:caption forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:32.0f]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:button];
}

- (void)handleCardSwipeButtonClick
{
    STDCardSwipeViewController *cardSwipeViewController = [[STDCardSwipeViewController alloc] init];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:cardSwipeViewController animated:NO];
}

- (void)handleResultsButtonClick
{
    STDResultsViewController *resultsViewController = [[STDResultsViewController alloc] initWithEmotionIndex:100];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:resultsViewController animated:NO];
}

- (void)handleExploreButtonClick
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumInteritemSpacing:1.0f];
    [layout setMinimumLineSpacing:1.0f];
    STDActivitiesViewController *exploreViewController = [[STDActivitiesViewController alloc] initWithCollectionViewLayout:layout];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:exploreViewController animated:NO];
}

- (void)handleTalkButtonClick
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumInteritemSpacing:1.0f];
    [layout setMinimumLineSpacing:2.0f];
    layout.sectionInset = UIEdgeInsetsMake(0.0, 1.0, 0.0, 1.0);
    STDTalkViewController *talkViewController = [[STDTalkViewController alloc] initWithCollectionViewLayout:layout];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:talkViewController animated:NO];
}

@end
