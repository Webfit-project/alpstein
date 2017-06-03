//
//  RMInfowindow.h
//  MapView
//
//  Created by Nicolas on 03/06/2017.
//
//

#import <UIKit/UIKit.h>


@class RMMapView, RMMarker;


@interface RMInfowindow : UIView
@property (strong, nonatomic) IBOutlet UILabel *_title;
@property (strong, nonatomic) IBOutlet UILabel *_desc;
@property (strong, nonatomic) IBOutlet UIButton *_infoBT;
- (IBAction)goInfo:(id)sender;
- (UIView *)createInfoWindow;
- (void)setTitle:(NSString *)title;
- (void)setDesc:(NSString *)desc;@end

#ifndef RMInfowindow_h
#define RMInfowindow_h


#endif /* RMInfowindow_h */
