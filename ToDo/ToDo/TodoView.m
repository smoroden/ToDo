//
//  TodoView.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "TodoView.h"

@implementation TodoView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:15.0];

    [[UIColor colorWithRed:0.797 green:0.988 blue:0.682 alpha:1] setFill];

    [path fill];
}

@end
