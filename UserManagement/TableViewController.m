//
//  TableViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "TableViewController.h"
#import "User.h"
#import "EditViewController.h"
<<<<<<< HEAD
#import "CustomCellTableViewCell.h"

=======
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
@interface TableViewController ()

@end

@implementation TableViewController
@synthesize listuser;
<<<<<<< HEAD
int rowid=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.listuser = [[NSMutableArray alloc] init];
    NSString* Account=[self readfile];
    NSArray *Array=[Account componentsSeparatedByString:@"\n"];
    for (NSString *ac in Array)
    {
        if(![ac isEqualToString:@""])
        {
            User*ur=[[User alloc] init];
            ur.Email=[ac componentsSeparatedByString:@" "][0];
            ur.Password=[ac componentsSeparatedByString:@" "][1];
            ur.FName=[ac componentsSeparatedByString:@" "][2];
            ur.LName=[ac componentsSeparatedByString:@" "][3];
            ur.Gender=[ac componentsSeparatedByString:@" "][4];
            [self.listuser addObject: ur];
        }
    }

=======
int rowid=nil;
- (void)viewDidLoad {
    [super viewDidLoad];
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

<<<<<<< HEAD
-(NSString*)readfile{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName = @"DataUser.txt";
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    NSMutableString *textFromFile;
    if(filePath)
    {
        textFromFile=[NSMutableString stringWithContentsOfFile:fileAtPath encoding:NSUTF8StringEncoding error:nil];
        return textFromFile;
    }
    return @"";
}
=======
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      return [listuser count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
<<<<<<< HEAD
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    CustomCellTableViewCell *cell = (CustomCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    User *user=[listuser objectAtIndex:indexPath.row];
    cell.lbFName.text =user.FName;
    cell.imgUser.image=[UIImage imageNamed:@"user-blue.png"];
    cell.lbLName.text=user.LName;
    cell.lbGender.text=user.Gender;
=======
    static NSString *simpleTableIdentifier = @"ListPrototypeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    User *user=[listuser objectAtIndex:indexPath.row];
    cell.textLabel.text =user.Email;
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
    return cell;
}

- (IBAction)btnEditCancel_Click:(UIStoryboardSegue *)unwindSegue {
<<<<<<< HEAD
    [self viewDidLoad];
    [self.tableView reloadData ];
=======
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
<<<<<<< HEAD
    rowid=(int)indexPath.row;
=======
    rowid=indexPath.row;
>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb
    [self performSegueWithIdentifier:@"segueEdit" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueEdit"])
    {
<<<<<<< HEAD
        EditViewController* VC= (EditViewController* )[segue destinationViewController];
        User *user=[self.listuser objectAtIndex:rowid];
        VC.email=user.Email;
        VC.pass=user.Password;
        VC.lname=user.LName;
        VC.fname=user.FName;
        VC.gender=user.Gender;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 80;}
=======
        EditViewController* VC= (EditViewController *)[segue destinationViewController];
        User *user=[self.listuser objectAtIndex:rowid];
        VC.email=user.Email;
        VC.pass=user.Password;
        
    }
}

>>>>>>> 6208a1dad6a6bc9c877abdf4eba71e4c1847defb

@end
