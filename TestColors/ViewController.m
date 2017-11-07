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



@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
}


- (IBAction)handleButtonTap:(AVCColorButton *)sender {
    
   
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
