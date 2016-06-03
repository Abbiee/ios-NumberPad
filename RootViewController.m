//
//  RootViewController.m
//  numKeyboard
//
//  Created by caa on 6/4/16.
//  Copyright © 2016 yahoo. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIView *childView;
@property (nonatomic) MainViewController *childVC;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.childVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    self.childVC.view.frame = self.childView.bounds;
    
    [self addChildViewController:self.childVC];
    [self.childVC didMoveToParentViewController:self];
    [self.childView addSubview:self.childVC.view];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
