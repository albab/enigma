//
//  AnswerViewController.h
//  enigmaapp
//
//  Created by Alex Babich on 5/5/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *back_button;

@property (strong, nonatomic) IBOutlet UILabel *question_label;

@property (strong, nonatomic) IBOutlet UITextField *answer_field;

@property (strong, nonatomic) IBOutlet UIButton *submit_answer_button;

- (IBAction)back_to_map:(id)sender;
- (IBAction)submit_answer:(id)sender;


@end
