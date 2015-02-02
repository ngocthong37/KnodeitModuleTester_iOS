//
//  List.m
//  Demo
//
//  Created by Ngoc Thong on 1/15/15.
//
//

#import "ListViewController.h"
#import "ChangeProfileViewController.h"
#import "AddFriendViewController.h"

#import "Data_Text.h"
#import "CustomTableViewCell.h"
#import "User+Helper.h"
#import "Friend+Helper.h"

Data_Text *data_text;
@interface ListViewController ()

@end

@implementation ListViewController
{
NSArray *data;
NSInteger index;
    
    NSMutableArray *Data_Users;
    NSMutableArray *Data_Friends;
}
@synthesize user=_user;
@synthesize friend=_friend;

-(void)reload{
    [self load_data];
    [self.tableView reloadData];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load_data];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated{

}

-(void)load_data{
//    data_text=[[Data_Text alloc]init];
//    data=[[data_text readfile] componentsSeparatedByString:@"\n"];
    
    //Data_Users=[User fetchAllUsers];
    
    Data_Friends=[Friend fetchAllFriends:self.user.email];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Data_Friends count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *simpleTableIdentifier = @"CustomTableCell";
    
    CustomTableViewCell *cell =(CustomTableViewCell*) [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
//    NSArray *profile=[[data objectAtIndex:indexPath.row]componentsSeparatedByString:@"\t"];
//    cell.lb_name.text = profile[2];
//    cell.lb_gender.text=profile[3];

    
    cell.lb_name.text=((Friend*) Data_Friends[indexPath.row]).fullName;
    cell.lb_1.text=@"Mobile: ";
    cell.lb_2.text=((Friend*) Data_Friends[indexPath.row]).mobile;
    
    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@",((Friend*) Data_Friends[indexPath.row]).photo]];
    
    cell.imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    index=indexPath.row;
    [self performSegueWithIdentifier:@"segue_list_profile" sender:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //UINavigationController *NaC=(UINavigationController*)[segue destinationViewController];
    if([[segue identifier] isEqualToString:@"segue_list_profile"]){
    ChangeProfileViewController *cp=(ChangeProfileViewController*)[segue destinationViewController];
    //self.user=Data_Users[index];
        self.friend=Data_Friends[index];
        cp.delegate=self;
    }
    else
    {
        AddFriendViewController *af=(AddFriendViewController*)[segue destinationViewController];
        af.delegate=self;
    }
    
}


- (IBAction)unwindToListViewController:(UIStoryboardSegue *)unwindSegue{

}

- (IBAction)bt_logout_click:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)bt_add_click:(id)sender {
    
    [self performSegueWithIdentifier:@"segue_list_add" sender:nil];
}
@end
