//
//  TableViewController.h
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
/*
@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) NSAttributedString *introString;
-(NSMutableArray *)createArrayOfStrings: (NSAttributedString *)introstring;


@property (nonatomic, strong) NSMutableArray *tableInput;

*/
@protocol ListTableViewControllerDelegate <NSObject>
- (void)removeAttributeOfSubstring:(NSRange)range;
@end

@interface TableViewController : UITableViewController
@property (weak, nonatomic) id delegate;
@property (strong, nonatomic) NSMutableArray *arrayColoredText;
@end
