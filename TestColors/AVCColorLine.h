//
//  AVCColorLine.h
//  TestColors
//
//  Created by Aleksey on 24.10.17.
//  Copyright © 2017 Aleksey Vinogradov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVCColorLine : NSObject

- (id)initWithAttributedString:(NSAttributedString *)strParam range:(NSRange)range;

@property (nonatomic, copy) NSAttributedString *string;
@property (nonatomic) NSRange range;

@end
