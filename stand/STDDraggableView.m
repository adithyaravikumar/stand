#import "STDDraggableView.h"
#import "STDOverlayView.h"

@interface STDDraggableView ()
@property BOOL positive;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic) CGPoint originalPoint;
@property (nonatomic, strong) STDOverlayView *overlayView;
@property CGPoint originalCenter;
@end

@implementation STDDraggableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;

    self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragged:)];
    [self addGestureRecognizer:self.panGestureRecognizer];

    return self;
}

- (void)loadStyleAndImage:(UIImage *)image
{
    self.originalCenter = self.center;
    
    self.layer.shadowOffset = CGSizeMake(7, 7);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.3;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [imageView setImage:image];
    [self addSubview:imageView];
    
    self.overlayView = [[STDOverlayView alloc] initWithFrame:self.bounds];
    self.overlayView.alpha = 0;
    [self addSubview:self.overlayView];
}

- (void)dragged:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGFloat xDistance = [gestureRecognizer translationInView:self].x;
    CGFloat yDistance = [gestureRecognizer translationInView:self].y;

    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:{
            self.originalPoint = self.center;
            break;
        };
        case UIGestureRecognizerStateChanged:{
            CGFloat rotationStrength = MIN(xDistance / 320, 1);
            CGFloat rotationAngel = (CGFloat) (2*M_PI/16 * rotationStrength);
            CGFloat scaleStrength = 1 - fabsf(rotationStrength) / 4;
            CGFloat scale = MAX(scaleStrength, 0.93);
            CGAffineTransform transform = CGAffineTransformMakeRotation(rotationAngel);
            CGAffineTransform scaleTransform = CGAffineTransformScale(transform, scale, scale);
            self.transform = scaleTransform;
            
            CGPoint newCenter = CGPointMake(self.originalPoint.x + xDistance, self.originalPoint.y + yDistance);
            
            if ([self isPointDraggedOutofBounds:newCenter])
            {
                [self.delegate draggableView:self didEndDragging:YES withMood:self.positive];
            }
            else
            {
                self.center = newCenter;
                [self updateOverlay:xDistance];
            }

            break;
        };
        case UIGestureRecognizerStateEnded: {
            [self resetViewPositionAndTransformations];
            break;
        };
        case UIGestureRecognizerStatePossible:break;
        case UIGestureRecognizerStateCancelled:break;
        case UIGestureRecognizerStateFailed:break;
    }
}

- (BOOL)isPointDraggedOutofBounds:(CGPoint)point
{
    return (point.x < self.originalCenter.x - 250 ||
            point.x > self.originalCenter.x + 250);
}

- (void)updateOverlay:(CGFloat)distance
{
    if (distance > 0) {
        self.overlayView.mode = GGOverlayViewModeRight;
        self.positive = YES;
    } else if (distance <= 0) {
        self.overlayView.mode = GGOverlayViewModeLeft;
        self.positive = NO;
    }
    CGFloat overlayStrength = MIN(fabsf(distance) / 100, 0.4);
    self.overlayView.alpha = overlayStrength;
}

- (void)discardView
{
    [self.delegate draggableView:self didEndDragging:YES withMood:self.positive];
}

- (void)resetViewPositionAndTransformations
{
    [UIView animateWithDuration:0.2
                     animations:^{
        self.center = self.originalPoint;
        self.transform = CGAffineTransformMakeRotation(0);
        self.overlayView.alpha = 0;
    }];
}

- (void)dealloc
{
    [self removeGestureRecognizer:self.panGestureRecognizer];
}

@end