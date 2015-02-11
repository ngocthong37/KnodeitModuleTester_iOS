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
#import "Friend+Helper.h"

Data_Text *data_text;
@interface ListViewController ()

@end

@implementation ListViewController
{
NSArray *data;
NSInteger index;
    //load tu core data
    NSMutableArray *Data_Users;
    NSMutableArray *Data_Friends;
    //load tu webservice
    NSMutableArray *Data_Profile;
}
@synthesize user=_user;
@synthesize friend=_friend;
@synthesize current_user=_current_user;

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


-(void)load_data{
//    data_text=[[Data_Text alloc]init];
//    data=[[data_text readfile] componentsSeparatedByString:@"\n"];
    
    //Data_Users=[User fetchAllUsers];
    
    //load tu code data
//    Data_Friends=[Friend fetchAllFriends:self.user.email];
    
    //load tu webservice
    Data_Profile=self.current_user[@"profiles"];
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
    //load danh sach friend tu coredata
//    return [Data_Friends count];
    //load danh sach tu webservice
    return [Data_Profile count];
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

    //load du lieu tu coredata
//    cell.lb_name.text=((Friend*) Data_Friends[indexPath.row]).fullName;
//    cell.lb_1.text=@"Mobile: ";
//    cell.lb_2.text=((Friend*) Data_Friends[indexPath.row]).mobile;
//    
//    NSString *imagePath = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"/Documents/%@",((Friend*) Data_Friends[indexPath.row]).photo]];
//    
//    cell.imageview.image=[UIImage imageWithContentsOfFile:imagePath];
    
    //load du lieu tu webservice
    cell.lb_1.text=@"id";
    cell.lb_2.text=[Data_Profile[indexPath.row][@"id"]stringValue];
    cell.imageview.hidden=true;
    cell.lb_name.hidden=true;
    
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
        //load tu Coredata
//        self.friend=Data_Friends[index];
        //load tu webservice
        cp.profile_id=[Data_Profile[index][@"id"]integerValue];
        
        
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
