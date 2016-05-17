//
//  TodoCell.m
//  ToDo
//
//  Created by Zach Smoroden on 2016-05-17.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiped:)];
    
    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self addGestureRecognizer:swipe];
    
    self.isStrike = NO;
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)swiped:(UIGestureRecognizer*)sender {

    [self.delegate updateTodo:self.indexPath];
}

@end
