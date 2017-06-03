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
}
@synthesize _title;
@synthesize _desc;
@synthesize _infoBT;


- (IBAction)moreinfo:(id)sender {
    NSLog(@"click boutton2");
}

- (void) awakeFromNib {

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

- (void)setTitle:(NSString *)title {
    self._title.text = title;
}

- (void)setDesc:(NSString *)desc {
    self._desc.text = desc;
}


@end
