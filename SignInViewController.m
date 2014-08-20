//
//  SignInViewController.m
//  NSUserDefaults, Segues, and Protocols Challenge Solution
//
//  Created by Bradley White on 8/19/14.
//  Copyright (c) 2014 Bradley White. All rights reserved.
//

#import "SignInViewController.h"
#import "CreateAccountViewController.h"
#import "SignInViewController.h"
#import "BWViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([sender isKindOfClass:[UIBarButtonItem class]]) {
        if ([segue.destinationViewController isKindOfClass:[CreateAccountViewController class]]) {
            CreateAccountViewController *viewController = segue.destinationViewController;
            viewController.delegate = self;
        }
    }
    
    if ([sender isKindOfClass:[UIButton class]]) {
        if ([segue.destinationViewController isKindOfClass:[BWViewController class]]) {
            BWViewController *viewController = segue.destinationViewController;
            viewController.passedUsername = self.usernameField.text;
            viewController.passedPassword = self.passwordField.text;
        }
    }
}

#pragma mark IBActions

- (IBAction)loginPressed:(UIButton *)sender
{
    NSArray *credentials = [[NSUserDefaults standardUserDefaults] arrayForKey:USER_INFO];
    NSLog(@"%i", [credentials count]);
    if ([credentials count] == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There are no users registered. Please create an account and try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    } else {
        NSString *username;
        NSString *password;
    
        for (NSDictionary *dictionary in credentials) {
            username = dictionary[USER_NAME];
            password = dictionary[USER_PASSWORD];
        }
        
        if ([self.usernameField.text isEqualToString:username] && [self.passwordField.text isEqualToString:password]) {
            [self performSegueWithIdentifier:@"toBWViewController" sender:sender];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login Error" message:@"Your username or password was incorrect. Please try again." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
        }
    }
}

- (IBAction)createAccountPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toCreateAccountViewController" sender:sender];
}

-(void)didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didCreateAccount
{
    [self dismissViewControllerAnimated:YES completion:nil];
}











@end
