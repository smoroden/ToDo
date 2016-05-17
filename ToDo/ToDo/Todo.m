//
//  Todo.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString*)title andDetails:(NSString*)details andPriority:(NSInteger)priority
{
    self = [super init];
    if (self) {
        _title = title;
        _detail = details;
        _priority = priority;
        _isCompleted = NO;
    }
    return self;
}

@end
