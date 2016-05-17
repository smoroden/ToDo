//
//  NewTodoView.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "NewTodoView.h"

@interface NewTodoView ()
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *detailTextField;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;
@property (nonatomic) NSInteger priority;


@property (weak, nonatomic) id<AddTodoDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@end

@implementation NewTodoView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:5.0];
//    
//    [[UIColor colorWithRed:0.797 green:0.988 blue:0.682 alpha:1] setFill];
//    
//    [path fill];
//}


-(void)awakeFromNib {
    

    self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %0.0f", self.stepper.value];
    
    
    
    
}
- (IBAction)stepped:(UIStepper *)sender {
    self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %0.0f", self.stepper.value];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:NO];
}


- (IBAction)doneButton:(UIButton *)sender {
    
    if ([self.titleTextField.text isEqualToString:@""] || [self.detailTextField.text isEqualToString:@""]) {
        NSLog(@"Can't do it.");
    } else {
        [self.delegate insertNewTodo:[[Todo alloc] initWithTitle:self.titleTextField.text andDetails:self.detailTextField.text andPriority:self.stepper.value]];
        
        [self.delegate doneWithAdd];

    }
    
}

@end
