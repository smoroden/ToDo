//
//  AddTodoViewController.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "AddTodoViewController.h"

@interface AddTodoViewController ()

@end

@implementation AddTodoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _priority = 1;
    self.priorityLabel.text = [NSString stringWithFormat:@"Priority: %ld", (long) self.priority];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
