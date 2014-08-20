//
//  SignInViewController.h
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Bradley White on 8/19/14.
//  Copyright (c) 2014 Bradley White. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateAccountViewController.h"

@interface SignInViewController : UIViewController <CreateAccountViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginPressed:(UIButton *)sender;


- (IBAction)createAccountPressed:(UIBarButtonItem *)sender;


@end
