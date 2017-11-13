//
//  TableViewController.h
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol ListTableViewControllerDelegate <NSObject>
- (void)removeAttributeOfSubstring:(NSRange)range;
@end

@interface TableViewController : UITableViewController
@property (assign, nonatomic) id delegate;
//@property (strong, nonatomic) NSMutableArray *arrayColoredText;
@property (retain, nonatomic) NSMutableArray *arrayColoredText;
@end
