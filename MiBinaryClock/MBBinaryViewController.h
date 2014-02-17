//
//  MBViewController.h
//  MiBinaryClock
//
//  Created by Derek Maurer on 2/8/14.
//  Copyright (c) 2014 Home School Dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBDotView.h"

@interface MBBinaryViewController : UIViewController
//Hour dots
@property (nonatomic) IBOutlet MBDotView *hr1;
@property (nonatomic) IBOutlet MBDotView *hr2;
@property (nonatomic) IBOutlet MBDotView *hr4;
@property (nonatomic) IBOutlet MBDotView *hr8;


//Minute dots
@property (nonatomic) IBOutlet MBDotView *min1;
@property (nonatomic) IBOutlet MBDotView *min2;
@property (nonatomic) IBOutlet MBDotView *min4;
@property (nonatomic) IBOutlet MBDotView *min8;
@property (nonatomic) IBOutlet MBDotView *min16;
@property (nonatomic) IBOutlet MBDotView *min32;

//Second dots
@property (nonatomic) IBOutlet MBDotView *sec1;
@property (nonatomic) IBOutlet MBDotView *sec2;
@property (nonatomic) IBOutlet MBDotView *sec4;
@property (nonatomic) IBOutlet MBDotView *sec8;
@property (nonatomic) IBOutlet MBDotView *sec16;
@property (nonatomic) IBOutlet MBDotView *sec32;

@property (nonatomic) IBOutlet UILabel *hr1Label;
@property (nonatomic) IBOutlet UILabel *hr2Label;
@property (nonatomic) IBOutlet UILabel *hr4Label;
@property (nonatomic) IBOutlet UILabel *hr8Label;
@property (nonatomic) IBOutlet UILabel *hr16Label;
@property (nonatomic) IBOutlet UILabel *hr32Label;

@property (nonatomic) IBOutlet UILabel *hrLabel;
@property (nonatomic) IBOutlet UILabel *minLabel;
@property (nonatomic) IBOutlet UILabel *secLabel;

@property (nonatomic) IBOutlet UIButton *showLegendButton;

- (IBAction)showLegendButtonPressed:(id)sender;

@end
