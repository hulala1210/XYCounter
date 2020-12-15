//
//  XYHomeController.m
//  XYCounter
//
//  Created by 谌彦霖 on 12/10/2020.
//  Copyright (c) 2020 谌彦霖. All rights reserved.
//

#import "XYHomeController.h"
#import "XYTableViewController.h"
#import "XYCollectionViewController.h"

@interface XYHomeController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UISwitch *swt;
@property (strong, nonatomic) IBOutlet UILongPressGestureRecognizer *longPressGesture;

@end

@implementation XYHomeController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonAction:(UIButton *)sender {
    XYTableViewController *vc = [[XYTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)longPressGestureAction:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        XYCollectionViewController *vc = [[XYCollectionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (IBAction)sliderAction:(UISlider *)sender {
    NSLog(@"sliderValueChangeTo %@",@(sender.value));
}

- (IBAction)switchAction:(UISwitch *)sender {
    NSLog(@"switchValueChangeTo %@",@(sender.on));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
