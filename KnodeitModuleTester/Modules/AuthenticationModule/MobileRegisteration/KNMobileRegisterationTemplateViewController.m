//
//  KNMobileRegisterationTemplateViewController.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "KNMobileRegisterationTemplateViewController.h"
#import "KNConstants.h"
#import "Manager.h"

@interface KNMobileRegisterationTemplateViewController ()

@property (strong, nonatomic) UIPickerView *countryPicker;

@property (strong, nonatomic) NSArray *countries;

@property (strong, nonatomic) NSDictionary *dialingCodes;

@property (strong, nonatomic) UIBarButtonItem *nextButton;

@end

@implementation KNMobileRegisterationTemplateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
    self.countryPicker = [[UIPickerView alloc] initWithFrame:CGRectZero];
    self.countryPicker.delegate = self;
    self.countryPicker.dataSource = self;
    [ self.countryPicker setShowsSelectionIndicator:YES];
    self.countryTF.inputView=self.countryPicker;
    self.nextButton = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStylePlain  target:self action:@selector(updateWithMobile:)];
    self.navigationItem.rightBarButtonItem = self.nextButton;
    self.nextButton.enabled=false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IB Actions


-(IBAction)updateWithMobile:(id)sender

{
    UIAlertView *alert;
    
    if (self.mobileNumberTF.text.length >= kMinimumPhoneNumbers) {
        NSString* mobileNr = [self.mobileNumberTF.text stringByReplacingOccurrencesOfString:@" " withString:@""];
        mobileNr = [mobileNr stringByReplacingOccurrencesOfString:@"+" withString:@""];
        //send to server
      
        NSDictionary * userData = [[UserManager sharedInstance] currentUser];
        
        [KNCommunicationManager actionRegisterMobile:mobileNr withUserName:userData[@"username"] completion:^(NSData *data, BOOL success) {
            if(success){
                NSError* error=nil;
                NSDictionary* returnData = (NSDictionary*)[NSJSONSerialization JSONObjectWithData:data  options:kNilOptions  error:&error];
                [UserManager sharedInstance].currentUser = returnData;
                [self registeredMobile:returnData];
            }
            else{
                UIAlertView* alert = [[UIAlertView alloc]initWithTitle:nil message:kNetworkError delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
    } else {
        alert = [[UIAlertView alloc]initWithTitle:nil message:kIncompletePhoneNumber delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
}


#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.countries.count;
}


#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.countryTF.text = [[self.countries objectAtIndex:row] objectForKey:@"name"];
    NSString *code = [[self.countries objectAtIndex:row] objectForKey:@"code"];
    
    code = [code lowercaseString];
    
    self.mobileNumberTF.text = [NSString stringWithFormat:@"+%@ ",[self.dialingCodes objectForKey:code]];
    self.nextButton.enabled=true;
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *str = [[self.countries objectAtIndex:row] objectForKey:@"name"];
    NSMutableAttributedString *mutableStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *mutParaStyle=[[NSMutableParagraphStyle alloc] init];
    mutParaStyle.alignment = NSTextAlignmentLeft;
    [mutableStr addAttribute:NSParagraphStyleAttributeName value:mutParaStyle range:NSMakeRange(0,[str length])];
    
    return mutableStr;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}


#pragma mark - Data source
- (NSArray *)countries
{
    if (!_countries) {
        _countries = [[NSArray alloc]initWithArray:[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Countries" ofType:@"plist"]]];
    }
    
    return _countries;
}

- (NSDictionary *)dialingCodes
{
    if (!_dialingCodes) {
        _dialingCodes = [[NSDictionary alloc]initWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DiallingCodes" ofType:@"plist"]];
    }
    
    return _dialingCodes;
}

#pragma mark - Registered
- (void) registeredMobile:(NSDictionary*)returnData{
    
}

@end
