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
#import "AVCColorLine.h"


@interface ViewController ()

//@property (atomic, strong) NSMutableArray *colorLine;

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
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




- (void)removeAttributeOfSubstring:(NSRange)range {
        [self.textView.textStorage removeAttribute:NSForegroundColorAttributeName range:range];
    }

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if ([segue.identifier isEqualToString:@"See"]) {
                TableViewController *vc = (TableViewController *)segue.destinationViewController;
                vc.arrayColoredText = [self getListOfAttributedStrings:self.textView.textStorage];
                vc.delegate = self;
            }
}
/*
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([[segue identifier] isEqualToString: @"SeeList"]) {
        NSAttributedString *intro = _textView.attributedText;
        TableViewController *vc =[segue destinationViewController];
        vc.introString = intro;
    }

}
*/
- (NSMutableArray *)getListOfAttributedStrings:(NSTextStorage *)textStorage {
      NSMutableArray *arraySelectedString = [[NSMutableArray alloc] init];
        [textStorage enumerateAttribute:NSForegroundColorAttributeName inRange:NSMakeRange(0, self.textView.text.length) options:NSAttributedStringEnumerationReverse usingBlock:^void(id value, NSRange range, BOOL *stop) {
                if (value) {
                        AVCColorLine *stringSelected = [[AVCColorLine alloc] initWithAttributedString:[textStorage attributedSubstringFromRange:range] range:range];
                        [arraySelectedString addObject:stringSelected];
                    }
           }];
        return arraySelectedString;
}

@end
