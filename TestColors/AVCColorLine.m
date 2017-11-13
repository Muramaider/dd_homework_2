//
//  AVCColorLine.m
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import "AVCColorLine.h"


@implementation AVCColorLine

- (id)initWithAttributedString:(NSAttributedString *)strParam range:(NSRange)range {
        self = [super init];
        if (self) {
            _string = [strParam copy];
            _range = range;
        }
        return self;
}

-(void)dealloc{
    [_string release];
    [super dealloc];
}

@end
