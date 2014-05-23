#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger , GGOverlayViewMode) {
    GGOverlayViewModeLeft,
    GGOverlayViewModeRight
};

@interface STDOverlayView : UIView
@property (nonatomic) GGOverlayViewMode mode;
@end