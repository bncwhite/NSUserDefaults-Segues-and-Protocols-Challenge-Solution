//
//  CreateAccountViewController.h
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Bradley White on 8/19/14.
//  Copyright (c) 2014 Bradley White. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USER_NAME @"username"
#define USER_PASSWORD @"password"
#define USER_INFO @"userInfo"

@protocol CreateAccountViewControllerDelegate <NSObject>

@required

-(void)didCancel;
-(void)didCreateAccount;

@end


@interface CreateAccountViewController : UIViewController

@property (weak, nonatomic) id <CreateAccountViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UITextField *passwordField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordField;

- (IBAction)cancelPressed:(UIButton *)sender;
- (IBAction)createPressed:(UIButton *)sender;

@end
