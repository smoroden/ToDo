//
//  AddTodoViewController.h
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AddTodoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (nonatomic) NSInteger priority;

//@property (weak, nonatomic) id<AddTodoDelegate> delegate;

@end
