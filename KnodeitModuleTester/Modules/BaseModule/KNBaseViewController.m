//
//  KNBaseViewController.m
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import "KNBaseViewController.h"

@interface KNBaseViewController ()

@end

@implementation KNBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.view.backgroundColor = [UIColor colorWithRed:35.0/255 green:211.0/255 blue:255.0/255 alpha:1.0];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"na_bg"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTranslucent:YES];
    
    
    //**********************************************************************//
    //    can thiet de bo khoang trong giua Navigation Bar va Scroll View   //
    self.automaticallyAdjustsScrollViewInsets=NO;                           //
    //**********************************************************************//
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
