//
//  AnswerViewController.m
//  enigmaapp
//
//  Created by Alex Babich on 5/5/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back_to_map:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    
    NSLog(@"LETS GO BACK TO THE MAP");
}

- (IBAction)submit_answer:(id)sender {
}
@end
