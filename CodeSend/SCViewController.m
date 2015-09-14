//
//  SCViewController.m
//  CodeSend
//
//  Created by Philip Del Vecchio on 9/14/15.
//  Copyright (c) 2015 pdv. All rights reserved.
//

#import "SCViewController.h"
#import <FBSDKMessengerShareKit/FBSDKMessengerShareKit.h>

@interface SCViewController ()

@end

@implementation SCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"SendCode";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messengerBubble"]
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:[FBSDKMessengerSharer class]
                                                                            action:@selector(openMessenger:)];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addLanguagePicker];
    [self addTextField];
}

#pragma mark Language Picker

- (void)addLanguagePicker {
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.f, self.view.frame.origin.y, self.view.frame.size.width, 44.f)
                                                          style:UITableViewStylePlain];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"language"];
    cell.textLabel.text = @"Language";
    [tableView addSubview:cell];
    [self.view addSubview:tableView];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[tableView]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(tableView)]];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"language"];
    cell.detailTextLabel.hidden = YES;
    [[cell viewWithTag:3] removeFromSuperview];
    
    UITextField *textField = [UITextField new];
    textField.tag = 3;
    textField.translatesAutoresizingMaskIntoConstraints = NO;
    [cell.contentView addSubview:textField];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:cell.textLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:8]];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop multiplier:1 constant:8]];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-8]];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:textField attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:cell.detailTextLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    textField.textAlignment = NSTextAlignmentRight;
    textField.delegate = self;
    
    UIPickerView *pickerView = [UIPickerView new];
    pickerView.delegate = self;
    textField.inputView = pickerView;
    textField.placeholder = @"Python";
    return cell;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    // Handle selection
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    NSUInteger rows = 5;
    return rows;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    switch (row)
    {
        case 0: return @"Python";
        case 1: return @"Obj-C";
        case 2: return @"C";
        case 3: return @"Java";
        case 4: return @"Javascript";
        default: return @"Error";
    }
}

#pragma mark Text Field

- (void)addTextField {
    CGRect frame = self.view.bounds;
    frame.origin.y += 150.f;
    frame.origin.x += 10.f;
    frame.size.width -= 20.f;
    frame.size.height -= 170.f;
    UITextView *tv = [[UITextView alloc] initWithFrame:frame];
    
    tv.backgroundColor = [UIColor grayColor];
    tv.font = [UIFont fontWithName:@"Menlo" size:12];
    [tv setContentOffset:CGPointZero animated:NO];
    [self.view addSubview:tv];
}

#pragma mark Sender

- (void)send {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
