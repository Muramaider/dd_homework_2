//
//  TableViewController.h
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) IBOutlet UITableView *Table;

@property (nonatomic, strong) NSMutableArray *tableInput;

@end
