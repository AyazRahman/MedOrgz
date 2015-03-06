//
//  loginViewController.m
//  MedOrgz
//
//  Created by Muhtasim Ayaz on 3/5/15.
//  Copyright (c) 2015 Muhtasim Ayaz. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

UIGestureRecognizer *tapper;

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
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (void)handleSingleTap:(UITapGestureRecognizer *) sender
{
    [self.view endEditing:YES];
}

- (IBAction)loginUser:(id)sender {
    [self checkfields];
}

- (IBAction)registration:(id)sender {
    [self performSegueWithIdentifier:@"registration" sender:nil];
}

-(void) checkfields{
    if ([_username.text isEqualToString:@""]
        ||[_password.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops"
                                                        message:@"All fields must be completed"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        [alert show];
    }
    else{
        [PFUser logInWithUsernameInBackground:_username.text password:_password.text block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops"
                                                                message:@"Something went wrong. Make sure all the info is correct"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles: nil];
                [alert show];
            }
            else{
                [self performSegueWithIdentifier:@"next" sender:self];
            }
        }];
    }
    
}

@end
