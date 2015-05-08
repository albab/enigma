//
//  AddNewRiddleViewController.m
//  enigmaapp
//
//  Created by Alex Babich on 5/5/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import "AddNewRiddleViewController.h"

@interface AddNewRiddleViewController () 

@end

@implementation AddNewRiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"So you want to add a riddle.");
    
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

- (IBAction)submit_riddle:(id)sender {
    NSLog(@"SUBMITTING RIDDLE");
    
    NSString *riddle_text = self.riddle_field.text;
    NSString *answer_text = self.answer_field.text;
    NSLog(@"riddle: %@", riddle_text);
    NSLog(@"answer: %@", answer_text);
    
    
    NSString *post = [NSString stringWithFormat:@"question=%@&answer=%@", riddle_text, answer_text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"https://enigmaa.herokuapp.com/new_riddle"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    
    NSURLResponse *requestResponse;
    NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding];
    NSLog(@"requestReply: %@", request);
    NSLog(@"requestReply: %@", requestReply);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

@end