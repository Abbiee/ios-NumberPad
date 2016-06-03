//
//  NumberPad.m
//  numKeyboard
//
//  Created by caa on 6/4/16.
//  Copyright © 2016 yahoo. All rights reserved.
//

#import "NumberPad.h"

@implementation NumberPad

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeSubviews];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initializeSubviews];
    }
    return self;
}

-(void) initializeSubviews {
   NSString *className = NSStringFromClass([self class]);
   UIView *view = [[[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] firstObject];
    [self addSubview:view];
    view.frame = self.bounds;
}

- (IBAction)keyTapped:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate keyWasTapped:sender.titleLabel.text];
    }
}
- (IBAction)backspaceTap:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate backspace];
    }
}

@end
