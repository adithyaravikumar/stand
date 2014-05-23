//
//  STDActivitiesViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/26/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDActivitiesViewController.h"
#import "STDActivityDetailViewController.h"
#import "STDMenuViewController.h"
#import "STDActivityDisplayCell.h"
#import "UIColor+HexAdditions.h"

static NSString * const _kCellIdentifier = @"cellIdentifier";

@interface STDActivitiesViewController ()
@property (nonatomic, strong)NSMutableArray *images;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@end

@implementation STDActivitiesViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    self.images = [[NSMutableArray alloc] initWithObjects:
                   @"activity1",
                   @"activity2",
                   @"activity3",
                   @"activity4",
                   @"activity5",
                   @"activity6", nil];
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.images = [[NSMutableArray alloc] initWithObjects:
                       @"activity1",
                       @"activity2",
                       @"activity3",
                       @"activity4", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.collectionView registerClass:[STDActivityDisplayCell class] forCellWithReuseIdentifier:_kCellIdentifier];
    [self setupHeader];
    [self.collectionView setFrame:CGRectMake(0, self.headerView.frame.size.height, self.view.frame.size.width,
                                             self.view.frame.size.height - self.headerView.frame.size.height)];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
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

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    STDActivityDisplayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_kCellIdentifier forIndexPath:indexPath];
    if (self.images != nil) {
        [cell setupCellWithDisplayImage:[UIImage imageNamed:self.images[indexPath.item]]];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    STDActivityDetailViewController *activityDetailsViewController = [[STDActivityDetailViewController alloc] initWithImage:[UIImage imageNamed:self.images[indexPath.item]]];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:activityDetailsViewController animated:NO];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width, 400);
}

@end
