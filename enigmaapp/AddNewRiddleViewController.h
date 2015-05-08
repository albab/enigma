//
//  AddNewRiddleViewController.h
//  enigmaapp
//
//  Created by Alex Babich on 5/5/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AddNewRiddleViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *back_button;
- (IBAction)back_to_map:(id)sender;

- (IBAction)submit_riddle:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *riddle_field;

@property (strong, nonatomic) IBOutlet UITextField *answer_field;



@end
