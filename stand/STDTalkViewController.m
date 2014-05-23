//
//  STDTalkViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/26/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDTalkViewController.h"
#import "STDMenuViewController.h"
#import "STDPhoneViewController.h"
#import "UIColor+HexAdditions.h"

static NSString * const _kCellIdentifier = @"cellIdentifier";

@interface STDTalkViewController ()
@property (nonatomic, strong)NSMutableArray *images;
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@end

@implementation STDTalkViewController

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    self.images = [[NSMutableArray alloc] initWithObjects:
                   @"counselor1",
                   @"counselor2",
                   @"counselor3",
                   @"counselor4",
                   @"counselor5",
                   @"counselor6",
                   @"counselor7",
                   @"counselor8",
                   @"counselor9",
                   @"counselor10", nil];
    return self;
}

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
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:_kCellIdentifier];
    [self setupHeader];
    [self.collectionView setFrame:CGRectMake(0, self.headerView.frame.size.height, self.view.frame.size.width,
                                             self.view.frame.size.height - self.headerView.frame.size.height)];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
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

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_kCellIdentifier forIndexPath:indexPath];
    if (self.images != nil) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 382, 382)];
        [imageView setImage:[UIImage imageNamed:self.images[indexPath.item]]];
        [cell.contentView addSubview:imageView];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    STDPhoneViewController *phoneViewController = [[STDPhoneViewController alloc] init];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:phoneViewController animated:NO];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(382, 382);
}

@end
