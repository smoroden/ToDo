//
//  NewTodoView.h
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddTodoDelegate <NSObject>

- (void)insertNewTodo:(Todo*)todo;
-(void)doneWithAdd;

@end

@interface NewTodoView : UIView


@end
