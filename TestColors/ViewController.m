//
//  ViewController.m
//  TestColors
//
//  Created by Aleksey on 17.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "ViewController.h"
#import "AVCColorButton.h"
#import "TableViewController.h"


@interface ViewController ()

@property (atomic, strong) NSMutableArray * colorLine;

@end

@implementation ViewController


-(void)viewDidLoad{
    
    self.colorLine = [NSMutableArray array];
}


- (IBAction)handleButtonTap:(AVCColorButton *)sender {
/*
    NSRange selectedRange = self.textView.selectedRange;

    if (selectedRange.length == 0) {
        UIAlertController *alert =   [UIAlertController
                                      alertControllerWithTitle:@"Warning"
                                      message:@"Select the text"
                                      preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];

        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
*/    
    [self.textView.textStorage addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor range:self.textView.selectedRange];
    
    
}
- (IBAction)clearButton:(id)sender {
    
    [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:self.textView.selectedRange];
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString: @"SeeList"]){
        
    
    TableViewController *vc = segue.destinationViewController;
    [vc.tableInput removeAllObjects];
    vc.tableInput = self.colorLine;

    }
}

@end
