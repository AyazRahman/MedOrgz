//
//  registrationViewController.m
//  MedOrgz
//
//  Created by Muhtasim Ayaz on 3/5/15.
//  Copyright (c) 2015 Muhtasim Ayaz. All rights reserved.
//

#import "registrationViewController.h"

@interface registrationViewController ()


@end

UIGestureRecognizer *tapper;

@implementation registrationViewController

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


- (IBAction)registration:(id)sender {
    
    [_username resignFirstResponder];
    [_email resignFirstResponder];
    [_password resignFirstResponder];
    [_retype resignFirstResponder];
    
    [self checkFieldsComplete];
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

-(void) checkFieldsComplete{
    if ([_username.text isEqualToString:@""]
        ||[_email.text isEqualToString:@""]
        ||[_password.text isEqualToString:@""]
        ||[_retype.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops"
                                                        message:@"All fields need to be completed"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        [alert show];
    }
    else{
        [self passwordmatch];
    }
}

-(void) passwordmatch{
    if ([_password.text isEqualToString:_retype.text ]) {
        
        [self registernewuser];
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops"
                                                        message:@"Passwords dont match try again"
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

-(void) registernewuser{
    PFUser *newuser = [PFUser user];
    newuser.username = _username.text;
    newuser.email = _email.text;
    newuser.password=_password.text;
    
    [newuser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            //NSLog(@"Success");
            [self dismissViewControllerAnimated:YES
                                     completion:nil];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ooops"
                                                            message:@"Something went wrong"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }];
}

@end
