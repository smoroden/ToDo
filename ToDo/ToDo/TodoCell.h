//
//  TodoCell.h
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
@protocol TodoEditDelegate <NSObject>

-(void)updateTodo:(NSIndexPath*)indexPath;

@end

@interface TodoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@property (nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) id<TodoEditDelegate> delegate;

@property (nonatomic) BOOL isStrike;

@end
