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
                [self setString:strParam];
                [self setRange:range];
        }
        return self;
}


@end
