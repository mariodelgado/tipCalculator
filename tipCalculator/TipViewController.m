//
//  TipViewController.m
//  tipCalculator
//
//  Created by Mario C. Delgado Jr. on 6/1/14.
//  Copyright (c) 2014 Mario C. Delgado Jr. All rights reserved.
//

#import "TipViewController.h"


@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UITextField *peopleTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UIStepper *peopleStepper;


- (IBAction)onTap:(id)sender;
- (void)updateValues;






@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.peopleStepper setMinimumValue:1];
    [self.peopleStepper  setContinuous:YES];
    [self.peopleStepper  setWraps:NO];
    [self.peopleStepper  setStepValue:1];
    [self.peopleStepper  setMaximumValue:300];
    self.peopleTextField.text=[NSString stringWithFormat:@"%g",self.peopleStepper.value];
    
    [self.billTextField becomeFirstResponder];
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    float peopleAmount = [self.peopleTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = (tipAmount + billAmount) / peopleAmount;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}




-(IBAction)stepperPressed1:(id)sender{
    self.peopleTextField.text=[NSString stringWithFormat:@"%g",self.peopleStepper.value];
    [self updateValues];

}

-(IBAction)didEndOnExit:(id)sender {
    self.peopleStepper.value = self.peopleTextField.text.doubleValue;
    self.peopleTextField.text=[NSString stringWithFormat:@"%g",self.peopleStepper.value];
    
}



@end
