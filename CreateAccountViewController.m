//
//  CreateAccountViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Bradley White on 8/19/14.
//  Copyright (c) 2014 Bradley White. All rights reserved.
//

#import "CreateAccountViewController.h"

@interface CreateAccountViewController ()

@end

@implementation CreateAccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelPressed:(UIButton *)sender
{
    [self.delegate didCancel];
}

- (IBAction)createPressed:(UIButton *)sender
{
    if ([self.passwordField.text isEqualToString:self.confirmPasswordField.text]) {
        if (![self.usernameField.text isEqualToString: @""] && self.usernameField.text.length >= 5) {
        
            NSMutableArray *credentials = [[[NSUserDefaults standardUserDefaults] arrayForKey:USER_INFO] mutableCopy];
            if (!credentials) credentials = [NSMutableArray new];
            
            if ([credentials count] > 0) [credentials removeAllObjects];
            [credentials addObject:[self createCredentialsForStorage]];
            NSLog(@"%@", credentials);
            [[NSUserDefaults standardUserDefaults] setObject:credentials forKey:USER_INFO];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            NSLog(@"%i", [credentials count]);
            
            [self.delegate didCreateAccount];
        } else {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Your username is less than 5 characters. It must be at least 5 characters in length." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertview show];
        }
    }
     else {
        
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Error!" message:@"Your password entries did not match. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertview show];
    }
}

-(NSDictionary *)createCredentialsForStorage
{
    NSDictionary *dictionary = @{USER_NAME : self.usernameField.text, USER_PASSWORD : self.passwordField.text};
    
    return dictionary;
}
@end
