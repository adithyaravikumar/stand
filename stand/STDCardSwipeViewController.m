//
//  VSHomeViewController.m
//  VoilaStylist
//
//  Created by Adithya Ravikumar on 4/17/14.
//  Copyright (c) 2014 voilatheapp. All rights reserved.
//

#import "STDCardSwipeViewController.h"
#import "STDMenuViewController.h"
#import "STDResultsViewController.h"
#import "STDDraggableView.h"
#import "UIColor+HexAdditions.h"

@interface STDCardSwipeViewController ()<VSDraggableViewDelegate>
@property NSInteger moodIndex;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@property (nonatomic, strong)UIButton *resultButton;
@property (nonatomic, strong)UILabel *captionLabel;
@property (nonatomic, strong)UIImageView *resultCard;
@property (nonatomic, strong) NSMutableArray *draggableViews;
@property NSInteger imageIndex;
@property CGFloat thumbnailWidth;
@property CGFloat thumbnailHeight;
@property CGFloat defaultX;
@property CGFloat defaultY;
@property CGFloat backgroundX;
@property CGFloat backgroundY;
@property CGRect currentThumbnailFrame;
@property CGRect previousThumbnailFrame;
@property BOOL elongated;
@property BOOL reduced;
@end

@implementation STDCardSwipeViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.draggableViews = [[NSMutableArray alloc] init];
        self.imageIndex = 0;
        self.moodIndex = 0;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    [self setupHeader];
    
    [self setupDefaultParameters];
    
    [self loadDraggableCustomViews];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)setupHeader
{
    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,
                                                               self.view.frame.size.height *0.1)];
    [self.headerView setBackgroundColor:[UIColor colorWithHexValue:0xededed alpha:0.5f]];
    self.iconButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.headerView.frame.size.width*0.2,
                                                                 self.headerView.frame.size.height*0.4)];
    self.captionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width,
                                                                  self.view.frame.size.height *0.1)];
    
    [self.captionLabel setText:@"What is your state of mind?"];
    [self.captionLabel setTextColor:[UIColor darkGrayColor]];
    [self.captionLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:32.0f]];
    [self.captionLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:self.captionLabel];
    
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

- (void)setupDefaultParameters
{
    self.thumbnailWidth = self.view.frame.size.width * 0.75;
    self.thumbnailHeight = self.view.frame.size.height * 0.75;
    
    self.defaultX = self.view.center.x - (self.thumbnailWidth * 0.5);
    self.defaultY = self.view.center.y - (self.thumbnailWidth * 0.5);
    
    self.backgroundX = self.defaultX - 15.0f;
    self.backgroundY = self.defaultY - 15.0f;
    
    self.currentThumbnailFrame = CGRectMake(self.defaultX, self.defaultY, self.thumbnailWidth, self.thumbnailHeight);
    self.previousThumbnailFrame = CGRectMake(self.backgroundX, self.backgroundY, self.thumbnailWidth, self.thumbnailHeight);
}

- (void)loadDraggableCustomViews
{
    int i = 1;
    while (i < 7)
    {
        STDDraggableView *draggableView = [[STDDraggableView alloc] initWithFrame:self.currentThumbnailFrame];
        [draggableView setCenter:self.view.center];
        [draggableView loadStyleAndImage:[UIImage imageNamed:[NSString stringWithFormat:@"Image%i",i]]];
        [draggableView setDelegate:self];
        [self.draggableViews addObject:draggableView];
        i += 1;
    }
    [self launchDraggableView];
}

- (void)launchDraggableView
{
    if (self.imageIndex < 4)
    {
        [self.view insertSubview:self.draggableViews[self.imageIndex] belowSubview:self.headerView];
        [self.draggableViews[self.imageIndex] setFrame:self.currentThumbnailFrame];
        [self.view insertSubview:self.draggableViews[self.imageIndex + 1] belowSubview:self.draggableViews[self.imageIndex]];
        [self.draggableViews[self.imageIndex + 1] setFrame:self.previousThumbnailFrame];
    }
}

- (void)draggableView:(STDDraggableView *)draggableView didEndDragging:(BOOL)ended withMood:(BOOL)mood
{
    if (ended) {
        
        switch(self.imageIndex)
        {
            case 0:
                if(!mood)
                {
                    self.moodIndex += 3;
                }
                break;
            case 1:
                if(!mood)
                {
                    self.moodIndex += 3;
                }
                break;
            case 2:
                if(!mood)
                {
                    self.moodIndex += 3;
                }
                break;
            case 3:
                if(mood)
                {
                    self.moodIndex += 6;
                }
                break;
            case 4:
                if(!mood)
                {
                    self.moodIndex += 3;
                }
                break;
            case 5:
                if(!mood)
                {
                    self.moodIndex += 3;
                }
                break;
        }
        
        [self.draggableViews[self.imageIndex] removeFromSuperview];
        [self.draggableViews[self.imageIndex] setFrame:self.currentThumbnailFrame];
        self.imageIndex += 1;
        
        if (self.imageIndex == 5) {
            [self.draggableViews[self.imageIndex] setFrame:self.currentThumbnailFrame];
            self.resultCard = [[UIImageView alloc] initWithFrame:self.currentThumbnailFrame];
            [self.resultCard setImage:[UIImage imageNamed:@"image7"]];
            [self.view addSubview:self.resultCard];
            
            self.resultButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 60)];
            [self.resultButton setCenter:CGPointMake(self.resultCard.center.x, self.resultCard.center.y + 50)];
            [self.resultButton setBackgroundColor:[UIColor colorWithHexValue:0x9c62d1 alpha:0.7f]];
            [self.resultButton setTitle:@"Right Here!" forState:UIControlStateNormal];
            [self.resultButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:28.0f]];
            [self.resultButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self.resultButton addTarget:self action:@selector(handleResultButtonClick) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:self.resultButton];
            
            UILabel *quoteLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                            self.currentThumbnailFrame.size.width, self.currentThumbnailFrame.size.height*0.3)];
            [quoteLabel setCenter:CGPointMake(self.resultButton.center.x, self.resultButton.center.y + 100)];
            [quoteLabel setText:@"'your words and thoughts have physical power.' - Will Smith"];
            [quoteLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:18.0f]];
            [quoteLabel setTextColor:[UIColor darkGrayColor]];
            [quoteLabel setTextAlignment:NSTextAlignmentCenter];
            [self.view addSubview:quoteLabel];
        }
        
        [self launchDraggableView];
    }
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

- (void)handleResultButtonClick
{
    STDResultsViewController *resultsViewController = [[STDResultsViewController alloc] initWithEmotionIndex:self.moodIndex];
    
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:resultsViewController animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
