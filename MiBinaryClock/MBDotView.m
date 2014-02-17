//
//  MBDotView.m
//  MiBinaryClock
//
//  Created by Derek Maurer on 2/8/14.
//  Copyright (c) 2014 Home School Dev. All rights reserved.
//

#import "MBDotView.h"
#import <QuartzCore/QuartzCore.h>

@interface MBDotView ()
{
    UIView *onView;
    BOOL _active;
}

@end

@implementation MBDotView

- (BOOL)activate
{
    return _active;
}

- (void)setActivate:(BOOL)a
{
    _active = a;
    
    [self.layer setCornerRadius:self.frame.size.width/2];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithRed:0.043 green:0.466 blue:0.945 alpha:1.0]];
    
    float alpha = _active ? 1.0 : 0.0;
    
    if (!onView)
    {
        onView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.name = @"gradient";
        gradient.frame = onView.bounds;
        gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.8 alpha:1.0] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
        [onView.layer insertSublayer:gradient atIndex:0];
        [onView setAlpha:0.0];
        [self addSubview:onView];
    }
    
    [onView setAlpha:alpha];
}

@end
