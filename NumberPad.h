//
//  NumberPad.h
//  numKeyboard
//
//  Created by caa on 6/4/16.
//  Copyright © 2016 yahoo. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol NumberPadDelegate <NSObject>
-(void) keyWasTapped:(NSString *)character;
-(void) backspace;
@end

@interface NumberPad : UIView
@property(nonatomic, weak) id <NumberPadDelegate> delegate;
@end
