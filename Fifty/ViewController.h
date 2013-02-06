//
//  ViewController.h
//  Fifty
//
//  Created by Michael  Gondi on 7/19/12.
//  Copyright (c) 2012 UC Merced. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface ViewController : UIViewController
@property(retain, nonatomic) IBOutlet UILabel *priceLabel;
@property(retain, nonatomic) IBOutlet UILabel *dollarSign;
@property(retain, nonatomic) IBOutlet UILabel *taxPercent;
@property(retain, nonatomic) IBOutlet UILabel *discountLabel;
@property(retain, nonatomic) IBOutlet UILabel *additionalDiscountLabel;
@property(retain, nonatomic) IBOutlet UILabel *taxLabel;
@property(retain, nonatomic) IBOutlet UILabel *dollarSign2;
@property(nonatomic, strong) IBOutlet UITextField *price;
@property(nonatomic, strong) IBOutlet UILabel *discount;
@property(nonatomic, strong) IBOutlet UILabel *additionalDiscount;
@property(retain, nonatomic) IBOutlet UIButton *total;
@property(retain, nonatomic) IBOutlet UILabel *totalPrice;
@property (retain, nonatomic) IBOutlet UISwitch *onSwitch;
@property(retain, strong) IBOutlet UITextField *taxPrice;



-(IBAction)tapBackground:(id)sender;
-(IBAction)textFieldDidChange:(id)sender;
-(IBAction)discountSliding:(id)sender;
-(IBAction)additionalDiscountSliding:(id)sender;
-(IBAction)totalPressed:(id)sender;
-(IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)taxTextFieldDidChange:(id)sender;
@end
