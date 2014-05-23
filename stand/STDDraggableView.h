#import <Foundation/Foundation.h>

@class STDOverlayView;
@protocol VSDraggableViewDelegate;

@interface STDDraggableView : UIView
@property (nonatomic, weak) id <VSDraggableViewDelegate> delegate;
- (void)loadStyleAndImage:(UIImage *)image;
@end

@protocol VSDraggableViewDelegate <NSObject>

@required
- (void) draggableView:(STDDraggableView *)draggableView didEndDragging:(BOOL)ended withMood:(BOOL)mood;
@end