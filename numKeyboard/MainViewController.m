//
//  MainViewController.m
//  numKeyboard
//
//  Created by caa on 6/4/16.
//  Copyright © 2016 yahoo. All rights reserved.
//

#import "MainViewController.h"
#import "NumberPad.h"

@interface MainViewController () <NumberPadDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UIButton *dismissKeyboard;
@property (nonatomic) IBOutlet UITextField *activeTextFiled;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeCustomKeyboard];
    
    [self registerForKeyboardNotifications];
    
}


- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    scrollView.contentInset = contentInsets;
//    scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your app might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
//    if (!CGRectContainsPoint(aRect, activeField.frame.origin) ) {
//        [self.scrollView scrollRectToVisible:activeField.frame animated:YES];
//    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
//    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
//    scrollView.contentInset = contentInsets;
//    scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textField becomeFirstResponder];
}

-(void) initializeCustomKeyboard {
    NumberPad *keyboard = [[NumberPad alloc] initWithFrame:CGRectMake(0, 0, 0, 300)];
    self.textField.inputView = keyboard;
    self.textField2.inputView = keyboard;
    
    keyboard.delegate = self;

    self.textField.delegate = self;
    self.textField2.delegate = self;
}

- (IBAction)onDismiss:(id)sender {
    [self.activeTextFiled endEditing:YES];
//     [self.view endEditing:YES];
}

-(void) keyWasTapped:(NSString *)character {
    [self.activeTextFiled insertText:character];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.activeTextFiled = nil;
}

-(void) backspace{
    [self.activeTextFiled deleteBackward];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeTextFiled = textField;
}

//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return YES;  // Hide both keyboard and blinking cursor.
//}

@end
