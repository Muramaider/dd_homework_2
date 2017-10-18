//
//  ViewController.m
//  TestColors
//
//  Created by Aleksey on 17.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "ViewController.h"
#import "AVCColorButton.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonTap:(AVCColorButton *)sender {
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
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    [text addAttribute:NSForegroundColorAttributeName value:sender.color range:self.textView.selectedRange];
    self.textView.attributedText = text;
    NSLog(@"%@ %@", sender.color, NSStringFromRange(self.textView.selectedRange));
  
}


@end
