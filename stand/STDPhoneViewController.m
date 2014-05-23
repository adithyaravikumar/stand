//
//  STDPhoneViewController.m
//  stand
//
//  Created by Adithya Ravikumar on 4/27/14.
//  Copyright (c) 2014 stand. All rights reserved.
//

#import "STDPhoneViewController.h"
#import "STDMenuViewController.h"
#import "UIColor+HexAdditions.h"
#import "TCDevice.h"
#import "TCConnection.h"

@interface STDPhoneViewController ()
@property (nonatomic, strong)UIView *headerView;
@property (nonatomic, strong)UIButton *menuButton;
@property (nonatomic, strong)UIButton *iconButton;
@property (nonatomic, strong)TCDevice* device;
@property (nonatomic, strong)TCConnection* connection;
@end

@implementation STDPhoneViewController

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
    [self setupHeader];
    
    CGFloat thumbnailWidth = self.view.frame.size.width * 0.75;
    
    CGFloat defaultX = self.view.center.x - (thumbnailWidth * 0.5);
    CGFloat defaultY = self.view.center.y - (thumbnailWidth * 0.5);
    
    UIImageView *displayImageView = [[UIImageView alloc] initWithFrame:CGRectMake(defaultX, defaultY, thumbnailWidth, thumbnailWidth)];
    [displayImageView setImage:[UIImage imageNamed:@"phoneImage"]];
    [self.view addSubview:displayImageView];
    
    UIButton *hangUpButton = [[UIButton alloc] initWithFrame:CGRectMake(defaultX, defaultY + thumbnailWidth, thumbnailWidth, 120)];
    [hangUpButton setBackgroundColor:[UIColor colorWithHexValue:0x9c62d1 alpha:0.7f]];
    [hangUpButton setTitle:@"Hang Up!" forState:UIControlStateNormal];
    [hangUpButton.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:28.0f]];
    [hangUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [hangUpButton addTarget:self action:@selector(disconnect) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hangUpButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self connect];
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
    if(self.connection)
    {
        [self disconnect];
    }
    STDMenuViewController *menuViewController = [[STDMenuViewController alloc] init];
    CATransition *transition = [CATransition animation];
    transition.duration = 0.3f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:menuViewController animated:NO];
}

-(void)connect
{
    NSString* capabilityToken = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzY29wZSI6InNjb3BlOmNsaWVudDppbmNvbWluZz9jbGllbnROYW1lPW1vbmtleSBzY29wZTpjbGllbnQ6b3V0Z29pbmc_YXBwU2lkPUFQYWJlNzY1MGY2NTRmYzM0NjU1ZmM4MWFlNzFjYWEzZmYmYXBwUGFyYW1zPSZjbGllbnROYW1lPW1vbmtleSIsImlzcyI6IkFDZDllYTQwZTQ1ZDEzZjczOGNiNmJmNTAyNzNiMjBiZjUiLCJleHAiOjEzOTg3OTQ0NjJ9.G4w3dMlKR_xbEX4AswVIkWb3QQqIDnCmh2C4fD-UsNg";
    
    self.device = [[TCDevice alloc] initWithCapabilityToken:capabilityToken
                                               delegate:nil];
    self.connection = [self.device connect:nil delegate:nil];
}


-(void)disconnect
{
    [self.connection disconnect];
    self.connection = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
