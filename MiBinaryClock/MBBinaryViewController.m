//
//  MBViewController.m
//  MiBinaryClock
//
//  Created by Derek Maurer on 2/8/14.
//  Copyright (c) 2014 Home School Dev. All rights reserved.
//

#import "MBBinaryViewController.h"

@interface MBBinaryViewController ()

@end

@implementation MBBinaryViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.063 green:0.486 blue:0.965 alpha:1.0]];
    
    [self timerTicked];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerTicked) userInfo:nil repeats:YES];
    
    [self showLegend:YES animated:YES];
}

- (void)timerTicked
{
    NSDate *date = [NSDate date];
    
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
    timeFormatter.dateFormat = @"HH";
    NSString *hourString = [timeFormatter stringFromDate:date];
    NSInteger hour = [hourString integerValue];
    if (hour > 12) hour -= 12;
    else if (hour == 0) hour = 12;
    timeFormatter.dateFormat = @"mm";
    NSString *minuteString = [timeFormatter stringFromDate:date];
    timeFormatter.dateFormat = @"ss";
    NSString *secString = [timeFormatter stringFromDate:date];
    
    [self resetDots];
    [self activateDotsForCurrentHour:hour];
    [self activateDotsForCurrentMinute:[minuteString integerValue]];
    [self activateDotsForCurrentSec:[secString integerValue]];
}

- (void)resetDots
{
    [self.hr1 setActivate:NO];
    [self.hr2 setActivate:NO];
    [self.hr4 setActivate:NO];
    [self.hr8 setActivate:NO];
    [self.min1 setActivate:NO];
    [self.min2 setActivate:NO];
    [self.min4 setActivate:NO];
    [self.min8 setActivate:NO];
    [self.min16 setActivate:NO];
    [self.min32 setActivate:NO];
    [self.sec1 setActivate:NO];
    [self.sec2 setActivate:NO];
    [self.sec4 setActivate:NO];
    [self.sec8 setActivate:NO];
    [self.sec16 setActivate:NO];
    [self.sec32 setActivate:NO];
}

- (void)activateDotsForCurrentHour:(NSInteger)hours
{
    NSInteger remainer = hours;
    while (remainer > 0)
    {
        if (remainer >= 8)
        {
            [self.hr8 setActivate:YES];
            remainer -= 8;
        }
        else if (remainer >= 4)
        {
            [self.hr4 setActivate:YES];
            remainer -= 4;
        }
        else if (remainer >= 2)
        {
            [self.hr2 setActivate:YES];
            remainer -= 2;
        }
        else if (remainer >= 1)
        {
            [self.hr1 setActivate:YES];
            remainer -= 1;
        }
    }
}

- (void)activateDotsForCurrentMinute:(NSInteger)minutes
{
    NSInteger remainer = minutes;
    while (remainer > 0)
    {
        if (remainer >= 32)
        {
            [self.min32 setActivate:YES];
            remainer -= 32;
        }
        else if (remainer >= 16)
        {
            [self.min16 setActivate:YES];
            remainer -= 16;
        }
        else if (remainer >= 8)
        {
            [self.min8 setActivate:YES];
            remainer -= 8;
        }
        else if (remainer >= 4)
        {
            [self.min4 setActivate:YES];
            remainer -= 4;
        }
        else if (remainer >= 2)
        {
            [self.min2 setActivate:YES];
            remainer -= 2;
        }
        else if (remainer >= 1)
        {
            [self.min1 setActivate:YES];
            remainer -= 1;
        }
    }
}

- (void)activateDotsForCurrentSec:(NSInteger)seconds
{
    NSInteger remainer = seconds;
    while (remainer > 0)
    {
        if (remainer >= 32)
        {
            [self.sec32 setActivate:YES];
            remainer -= 32;
        }
        else if (remainer >= 16)
        {
            [self.sec16 setActivate:YES];
            remainer -= 16;
        }
        else if (remainer >= 8)
        {
            [self.sec8 setActivate:YES];
            remainer -= 8;
        }
        else if (remainer >= 4)
        {
            [self.sec4 setActivate:YES];
            remainer -= 4;
        }
        else if (remainer >= 2)
        {
            [self.sec2 setActivate:YES];
            remainer -= 2;
        }
        else if (remainer >= 1)
        {
            [self.sec1 setActivate:YES];
            remainer -= 1;
        }
    }
}

- (IBAction)showLegendButtonPressed:(id)sender
{
    [self showLegend:(self.hrLabel.alpha == 0.0) animated:YES];
}

- (void)showLegend:(BOOL)show animated:(BOOL)animated
{
    float alpha = show ? 1.0 : 0.0;
    
    if (animated)
    {
        [UIView animateWithDuration:0.4 animations:^{
            [self.hr1Label setAlpha:alpha];
            [self.hr2Label setAlpha:alpha];
            [self.hr4Label setAlpha:alpha];
            [self.hr8Label setAlpha:alpha];
            [self.hr16Label setAlpha:alpha];
            [self.hr32Label setAlpha:alpha];
            [self.hrLabel setAlpha:alpha];
            [self.minLabel setAlpha:alpha];
            [self.secLabel setAlpha:alpha];
        }];
        
        [[UIApplication sharedApplication] setStatusBarHidden:!show withAnimation:UIStatusBarAnimationFade];
    }
    else
    {
        [self.hr1Label setAlpha:alpha];
        [self.hr2Label setAlpha:alpha];
        [self.hr4Label setAlpha:alpha];
        [self.hr8Label setAlpha:alpha];
        [self.hr16Label setAlpha:alpha];
        [self.hr32Label setAlpha:alpha];
        [self.hrLabel setAlpha:alpha];
        [self.minLabel setAlpha:alpha];
        [self.secLabel setAlpha:alpha];
        
        [[UIApplication sharedApplication] setStatusBarHidden:!show withAnimation:UIStatusBarAnimationNone];
    }
    
    if (show)
        [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(legendTimerExpired) userInfo:nil repeats:NO];
}

- (void)legendTimerExpired
{
    [self showLegend:NO animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

@end
