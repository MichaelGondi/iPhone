//
//  ViewController.m
//  Fifty
//
//  Created by Michael  Gondi on 7/19/12.
//  Copyright (c) 2012 UC Merced. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize priceLabel;
@synthesize dollarSign;
@synthesize discountLabel;
@synthesize additionalDiscountLabel;
@synthesize taxLabel;
@synthesize dollarSign2;
@synthesize price;
@synthesize discount;
@synthesize additionalDiscount;
@synthesize total;
@synthesize totalPrice;
@synthesize tax;
@synthesize onSwitch;


- (IBAction)textFieldDidChange:(id)sender{
	UITextField * textField = (UITextField *) sender;
	int maxChars = 10;
	int charsLeft = maxChars - textField.text.length;
	if(charsLeft < 0) {
		UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Too Many Digits"
                                                         message:[NSString stringWithFormat:@"10 digit maximum"]
                                                        delegate:nil
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles:nil];
		[alert show];
		[alert release];
        price.text =@"";
	}
}
 
/*
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    
    // allow backspace
    if (range.length > 0 && [string length] == 0) {
        return YES;
    }
    // do not allow . at the beggining
    if (range.location == 0 && [string isEqualToString:@"."]) {
        return NO;
    }
    // set the text field value manually
    NSString *newValue = [[price text] stringByReplacingCharactersInRange:range withString:string];
    newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
    price.text = newValue;
    // return NO because we're manually setting the value
    return NO;
}
 */

- (IBAction)textFieldDoneEditing:(id)sender{
    [sender resignFirstResponder];
}
-(IBAction)discountSliding:(id)sender{
    UISlider *s = (UISlider *) sender;
    int percent = (int) s.value;
    NSString *percentLabel = [[NSString alloc]initWithFormat:@"%i%%", percent];
    //change old label
    discount.text = percentLabel;
    [percentLabel release];
}
-(IBAction)additionalDiscountSliding:(id)sender{
    UISlider *s = (UISlider *) sender;
    int percent = (int) s.value;
    NSString *percentLabel = [[NSString alloc]initWithFormat:@"%i%%", percent];
    //change old label
    additionalDiscount.text = percentLabel;
    [percentLabel release];
}
-(IBAction)taxSliding:(id)sender{
    UISlider *s = (UISlider *) sender;
    double percent = (double) s.value;
    NSString *percentLabel = [[NSString alloc]initWithFormat:@"%.2f%%", percent];
    //change old label
    tax.text = percentLabel;
    [percentLabel release];
}
-(IBAction)tapBackground:(id)sender{
    [price resignFirstResponder];
}
-(IBAction)totalPressed:(id)sender{
    double d1 = discount.text.doubleValue;
    double d2 = additionalDiscount.text.doubleValue;
    double userPrice = price.text.doubleValue;
    double origDiscount = ((double)d1/100)*userPrice;
    double addDiscount = ((double)d2/100)*(userPrice-origDiscount);
    double t1 = tax.text.doubleValue;
    double final = userPrice - ((origDiscount)+(addDiscount));
    double taxPrice = (double)t1/100*final;
    double finalPrice = final + taxPrice;
    NSString *subtotal = [[NSString alloc]initWithFormat:@"%.2f", finalPrice];
    NSString *subtotalNoTax = [[NSString alloc]initWithFormat:@"%.2f", final];
    if(onSwitch.on)
        totalPrice.text = subtotal;
    else{
        totalPrice.text = subtotalNoTax;
    }
    [subtotal release];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //price.delegate = self;
    priceLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    dollarSign.font = [UIFont boldSystemFontOfSize:18.0f];
    discountLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    additionalDiscount.font = [UIFont boldSystemFontOfSize:18.0f];
    discount.font = [UIFont boldSystemFontOfSize:18.0f];
    additionalDiscountLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    tax.font = [UIFont boldSystemFontOfSize:18.0f];
    taxLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    dollarSign2.font = [UIFont boldSystemFontOfSize:18.0f];
    totalPrice.font = [UIFont boldSystemFontOfSize:18.0f];
    price.keyboardType=UIKeyboardTypeDecimalPad;
    price.clearButtonMode = UITextFieldViewModeWhileEditing;

}

- (void)viewDidUnload
{
    [self setTotal:nil];
    [self setTotalPrice:nil];
    [self setTax:nil];
    [self setPriceLabel:nil];
    [self setDollarSign:nil];
    [self setDiscountLabel:nil];
    [self setAdditionalDiscountLabel:nil];
    [self setTaxLabel:nil];
    [self setDollarSign2:nil];
    [self setOnSwitch:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    price=nil;
    discount=nil;
    additionalDiscount=nil;
    total=nil;
    totalPrice=nil;
    tax=nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)dealloc {
    [total release];
    [totalPrice release];
    [tax release];
    [priceLabel release];
    [dollarSign release];
    [discountLabel release];
    [additionalDiscountLabel release];
    [taxLabel release];
    [dollarSign2 release];
    [onSwitch release];
    [super dealloc];
}
@end
