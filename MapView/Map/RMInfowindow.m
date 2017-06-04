//
//  RMInfowindow.m
//  MapView
//
//  Created by Nicolas on 03/06/2017.
//
//

#import <Foundation/Foundation.h>
#import "RMInfowindow.h"
@implementation RMInfowindow {
       UIView *infoWindowView;
    CAShapeLayer *_colorDotLayer;
}
@synthesize _title;
@synthesize _desc;
@synthesize _infoBT;


- (IBAction)moreinfo:(id)sender {
    NSLog(@"click boutton2");
}

- (void) awakeFromNib {
    
    [super awakeFromNib];
}


- (UIView *)createInfoWindow
{
    NSLog(@"on crée l'info window");
   infoWindowView = [[[NSBundle mainBundle] loadNibNamed:@"infowindow" owner:self options:nil] objectAtIndex:0];
    self._title = [infoWindowView viewWithTag:2];
    self._desc = [infoWindowView viewWithTag:3];
    

    /*
        UITapGestureRecognizer *singleTapRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)] autorelease];
    
    
    singleTapRecognizer.numberOfTouchesRequired = 1;
     - (void)setTitle:(NSString *)title {
     self._title.text = title;
     }    [self addGestureRecognizer:singleTapRecognizer];
     */
    
    return infoWindowView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_colorDotLayer == nil) {
        _colorDotLayer = [CAShapeLayer layer];
        _colorDotLayer.fillColor = [[UIColor whiteColor] CGColor];
        [self.layer addSublayer:_colorDotLayer];
    }


    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:(CGPoint){self.bounds.size.width/2, self.bounds.size.height+15}];
    [path addLineToPoint:(CGPoint){self.bounds.size.width/2+10, self.bounds.size.height-1}];
    [path addLineToPoint:(CGPoint){self.bounds.size.width/2, self.bounds.size.height-1}];
    [path addLineToPoint:(CGPoint){self.bounds.size.width/2-10, self.bounds.size.height-1}];
    
    // Create a CAShapeLayer with this triangular path
    // Same size as the original imageView
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.frame = self.bounds;
    mask.path = path.CGPath;
    _colorDotLayer.path = path.CGPath;
}

- (void)setTitle:(NSString *)title {
    self._title.text = title;
}

- (void)setDesc:(NSString *)desc {
    self._desc.text = desc;
}


@end
