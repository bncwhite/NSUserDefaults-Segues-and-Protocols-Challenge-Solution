//
//  BWViewController.h
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Bradley White on 8/19/14.
//  Copyright (c) 2014 Bradley White. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (nonatomic) NSString *passedUsername;
@property (nonatomic) NSString *passedPassword;


@end
