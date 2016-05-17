//
//  Todo.h
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic) NSString  *title;
@property (nonatomic) NSString  *detail;
@property (nonatomic) NSInteger priority;
@property (nonatomic) BOOL      isCompleted;

- (instancetype)initWithTitle:(NSString*)title andDetails:(NSString*)details andPriority:(NSInteger)priority;

@end
