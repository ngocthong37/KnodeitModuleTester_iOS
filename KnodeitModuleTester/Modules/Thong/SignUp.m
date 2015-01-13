//
//  SignUp.m
//  Demo
//
//  Created by Ngoc Thong on 1/13/15.
//
//

#import "SignUp.h"
#import "KNAppDelegate.h"
#import <CoreData/CoreData.h>

@interface SignUp ()

@end

@implementation SignUp

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bt_signup_click:(id)sender {

    KNAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newContact;
    newContact = [NSEntityDescription
                  insertNewObjectForEntityForName:@"USER"
                  inManagedObjectContext:context];
    [newContact setValue: tf_email.text forKey:@"email"];

    //[newContact setValue: tf_password.text forKey:@"password"];

    NSError *error;
    [context save:&error];
    
    lb.text=@"TC";
}
@end
