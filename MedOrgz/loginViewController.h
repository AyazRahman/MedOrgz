//
//  loginViewController.h
//  MedOrgz
//
//  Created by Muhtasim Ayaz on 3/5/15.
//  Copyright (c) 2015 Muhtasim Ayaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface loginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)loginUser:(id)sender;

@end
