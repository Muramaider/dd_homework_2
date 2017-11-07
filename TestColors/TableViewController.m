//
//  TableViewController.m
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "AVCColorLine.h"

@implementation TableViewController;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrayColoredText count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
        cell.textLabel.numberOfLines = 0;
        AVCColorLine *selectedString = self.arrayColoredText[indexPath.row];
        cell.textLabel.attributedText = selectedString.string;
        return cell;
}
    
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
        if (editingStyle) {
                AVCColorLine *selectedString = self.arrayColoredText[indexPath.row];
                [self.delegate removeAttributeOfSubstring:selectedString.range];
                   [self.arrayColoredText removeObjectAtIndex:indexPath.row];
                   [tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
               }
}

/*
@interface TableViewController ()

@property (nonatomic, strong) NSArray *array;

@end

@implementation TableViewController;

@synthesize introString;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = [self createArrayOfStrings:(NSAttributedString *)introString];
    [self.TableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SeeList"];
    
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSMutableArray *)createArrayOfStrings:(NSAttributedString *)introstring{
    __block NSAttributedString *blockString = introString;
    __block NSMutableArray *arrayOfAttributetString = [[NSMutableArray alloc] init];
    [introString enumerateAttribute:NSForegroundColorAttributeName
                            inRange:NSMakeRange(0, introString.length)
                            options:NSAttributedStringEnumerationReverse usingBlock:^(id _Nullable value, NSRange range, BOOL * _Nonnull stop)
     {
         if(value && range.length > 1) {
             [arrayOfAttributetString addObject: [blockString attributedSubstringFromRange:range]];
              
         }
     }];
    NSLog(@"ArrayCreated");
    return arrayOfAttributetString;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowInTableView");
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SeeList" forIndexPath:indexPath];
   // NSLog(@"CellForRowAtIndexPath: {%1d,%1d}", (long)indexPath.section, (long)indexPath.row);
   // NSLog(@"CellCreated");
    NSAttributedString *string = self.array[indexPath.row];
    cell.textLabel.attributedText = string;
    
    return cell;
    
}
*/
@end
