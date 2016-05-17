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
    self.isStrike = !self.isStrike;
    
    if(self.isStrike) {
        NSAttributedString *titleString = [[NSAttributedString alloc] initWithString:self.titleLabel.text attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        [self.titleLabel setAttributedText:titleString];
        
        NSAttributedString *detailString = [[NSAttributedString alloc] initWithString:self.detailLabel.text attributes:@{NSStrikethroughStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        [self.detailLabel setAttributedText:detailString];
    } else {
        self.titleLabel.text = self.titleLabel.text;
        self.detailLabel.text = self.detailLabel.text;
    }

    [self.delegate updateTodo:self.indexPath];
}

@end
