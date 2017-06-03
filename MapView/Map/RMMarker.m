//
//  RMMarker.m
//
// Copyright (c) 2008-2012, Route-Me Contributors
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "RMMarker.h"
#import "RMPixel.h"
#import "RMInfowindow.h"
@implementation RMMarker

@synthesize label;
@synthesize title;
@synthesize desc;
@synthesize ido;
@synthesize textForegroundColor;
@synthesize textBackgroundColor;

#define defaultMarkerAnchorPoint CGPointMake(0.5, 0.5)

+ (UIFont *)defaultFont
{
    return [UIFont systemFontOfSize:15];
}

// init
- (id)init
{
    NSLog(@" init rmmarker");
    if (!(self = [super init]))
        return nil;
    
    label = nil;
    ido = nil;
    textForegroundColor = [UIColor blackColor];
    textBackgroundColor = [UIColor clearColor];
    
    return self;
}

- (id)initWithUIImage:(UIImage *)image
{
    NSLog(@" initwithuiimage n1");
    return [self initWithUIImage:image anchorPoint:defaultMarkerAnchorPoint];
}

- (id)initWithUIImage:(UIImage *)image anchorPoint:(CGPoint)_anchorPoint
{
    NSLog(@" initwithuiimage n2");
    
    if (!(self = [self init]))
        return nil;
    
    self.contents = (id)[image CGImage];
    self.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    self.anchorPoint = _anchorPoint;
    
    self.masksToBounds = NO;
    self.label = nil;
    
    return self;
}

- (void)dealloc
{
    self.label = nil;
    self.textForegroundColor = nil;
    self.textBackgroundColor = nil;
    [super dealloc];
}

#pragma mark -

- (void)replaceUIImage:(UIImage *)image
{
    NSLog(@" replaceuiimage n°1");
    
    [self replaceUIImage:image anchorPoint:defaultMarkerAnchorPoint];
}

- (void)replaceUIImage:(UIImage *)image anchorPoint:(CGPoint)_anchorPoint
{
    NSLog(@" replaceuiimage n°2");
    
    self.contents = (id)[image CGImage];
    self.bounds = CGRectMake(50, 50, image.size.width, image.size.height);
    self.anchorPoint = _anchorPoint;
    
    self.masksToBounds = YES;
}




- (void)setLabel:(UIView *)aView
{
    if (label == aView)
        return;
    
    if (label != nil)
    {
        [[label layer] removeFromSuperlayer];
        [label release]; label = nil;
    }
    
    if (aView != nil)
    {
        label = [aView retain];
        CALayer *infowindow = [label layer];
     
        [infowindow setName: ido];
        
        
        NSLog(@"self.ido = %@",self.ido);
        
        
        [self addSublayer:infowindow];
    }
}

- (void)setTextBackgroundColor:(UIColor *)newTextBackgroundColor
{
    NSLog(@"settextbackground");
    [textBackgroundColor autorelease];
    textBackgroundColor = [newTextBackgroundColor retain];
    
    self.label.backgroundColor = textBackgroundColor;
}

- (void)setTextForegroundColor:(UIColor *)newTextForegroundColor
{
    NSLog(@"set textforeground");
    [textForegroundColor autorelease];
    textForegroundColor = [newTextForegroundColor retain];
    
    if ([self.label respondsToSelector:@selector(setTextColor:)])
        ((UILabel *)self.label).textColor = textForegroundColor;
}
/*
- (void)createMarker:(NSString *)title desc:(NSString *)desc ido:(NSString*)ido position:(CGPoint)position font:(UIFont *)font {
    
    CGSize textSize = [title sizeWithFont:font];
    CGRect frame = CGRectMake(position.x-10, position.y-45, textSize.width+20, textSize.height+20);

    
    RMInfowindow *infowindow = [[RMInfowindow alloc] initWithFrame:frame];

    
    [infowindow setTitle:@"mon titre a moi haha"];
    UIView *iwView = [infowindow createInfoWindow];
    [infowindow setTitle:@"mon ptit titre"];
    
    [self setLabel:iwView];
    
}
 */

- (void)changeLabelUsingText:(NSString *)text
{
    NSLog(@" change label using text n°3");
    CGPoint position = CGPointMake([self bounds].size.width / 2 - [text sizeWithFont:[RMMarker defaultFont]].width / 2, 4);
    [self changeLabelUsingText:text position:position font:[RMMarker defaultFont] foregroundColor:[self textForegroundColor] backgroundColor:[self textBackgroundColor]];
}

- (void)changeLabelUsingText:(NSString*)text position:(CGPoint)position
{
    [self changeLabelUsingText:text position:position font:[RMMarker defaultFont] foregroundColor:[self textForegroundColor] backgroundColor:[self textBackgroundColor]];
}

- (void)changeLabelUsingText:(NSString *)text font:(UIFont *)font foregroundColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor
{
    NSLog(@" change label using text n°2");
    CGPoint position = CGPointMake([self bounds].size.width / 2 - [text sizeWithFont:font].width / 2, 4);
    [self setTextForegroundColor:textColor];
    [self setTextBackgroundColor:backgroundColor];
    [self changeLabelUsingText:text  position:position font:font foregroundColor:textColor backgroundColor:backgroundColor];
}

- (void) createInfoWindow:(NSString *)_title desc:(NSString *)_desc ido:(NSString *)_ido {
    CGPoint position = CGPointMake([self bounds].size.width / 2 , 4);
    
    CGRect frame = CGRectMake(position.x-10, position.y-45, [self bounds].size.width+20, [self bounds].size.height+20);

    
    RMInfowindow *infowindow = [[RMInfowindow alloc] initWithFrame:frame];


    UIView *iwView = [infowindow createInfoWindow];
    [infowindow setTitle:_title];
    [infowindow setDesc:_desc];
   self.ido = _ido;
    
    [self setLabel:iwView];
    
    
    [infowindow release];

    
}
- (void)changeLabelUsingText:(NSString *)text position:(CGPoint)position font:(UIFont *)font foregroundColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor
{
    NSLog(@" change label using text n°1");
    CGSize textSize = [text sizeWithFont:font];
    CGRect frame = CGRectMake(position.x-10, position.y-45, textSize.width+20, textSize.height+20);
    /*
     UILabel *aLabel = [[UILabel alloc] initWithFrame:frame];
     [self setTextForegroundColor:textColor];
     [self setTextBackgroundColor:backgroundColor];
     [aLabel setNumberOfLines:3];
     [aLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
     [aLabel setBackgroundColor:backgroundColor];
     [aLabel setTextColor:textColor];
     [aLabel setFont:font];
     [aLabel setTextAlignment:NSTextAlignmentLeft];
     [aLabel setText:text];
     
     
     [self setLabel:aLabel];
     [aLabel release];
     */
    
    RMInfowindow *infowindow = [[RMInfowindow alloc] initWithFrame:frame];
    //  RMInfowindow *infowindow = [[[NSBundle mainBundle] loadNibNamed:@"infowindow" owner:self options:nil] objectAtIndex:0];
    
    [infowindow setTitle:@"mon titre a moi haha"];
    UIView *iwView = [infowindow createInfoWindow];
    [infowindow setTitle:@"mon ptit titre"];
    
    [self setLabel:iwView];
    
    
    [infowindow release];
    
}

- (void)toggleLabel
{
    if (self.label == nil)
        return;
    
    if ([self.label isHidden])
        [self showLabel];
    else
        [self hideLabel];
}

- (void)showLabel
{
    if ([self.label isHidden])
    {
        // Using addSublayer will animate showing the label, whereas setHidden is not animated
        [self addSublayer:[self.label layer]];
        [self.label setHidden:NO];
    }
}

- (void)hideLabel
{
    if (![self.label isHidden])
    {
        // Using removeFromSuperlayer will animate hiding the label, whereas setHidden is not animated
        [[self.label layer] removeFromSuperlayer];
        [self.label setHidden:YES];
    }
}

@end
