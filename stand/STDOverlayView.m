#import "STDOverlayView.h"

@interface STDOverlayView ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation STDOverlayView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.backgroundColor = [UIColor whiteColor];
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"noIcon"]];
    [self addSubview:self.imageView];

    return self;
}

- (void)setMode:(GGOverlayViewMode)mode
{
    if (_mode == mode) return;

    _mode = mode;
    if (mode == GGOverlayViewModeLeft) {
        self.imageView.image = [UIImage imageNamed:@"noIcon"];
    } else {
        self.imageView.image = [UIImage imageNamed:@"yesIcon"];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(50, 50, 100, 100);
}

@end