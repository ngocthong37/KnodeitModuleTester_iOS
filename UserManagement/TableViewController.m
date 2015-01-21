//
//  TableViewController.m
//  UserManagement
//
//  Created by NUS Staff on 1/15/15.
//  Copyright (c) 2015 com.test. All rights reserved.
//

#import "TableViewController.h"
#import "EditViewController.h"
#import "CustomCellTableViewCell.h"

@interface TableViewController ()

@end

@implementation TableViewController
@synthesize listuser;
int rowid=0;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.rowedit=-1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
      return [listuser count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    CustomCellTableViewCell *cell = (CustomCellTableViewCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    User *user=[listuser objectAtIndex:indexPath.row];
    if(indexPath.row==[self rowedit])
    {
        User *edituser=[[User alloc] init];
        edituser.Email=self.email;
        edituser.Password=self.pass;
        edituser.FName=self.fname;
        edituser.LName=self.lname;
        edituser.Gender=self.gender;
        user=edituser;
    }
    cell.lbFName.text =user.FName;
    
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileName =[NSString stringWithFormat:@"%@.jpg",user.Email];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile: fileAtPath];
    if(img!=nil)
    {
        cell.imgUser.image=img;
    }
    else
    {
        cell.imgUser.image=[UIImage imageNamed:@"user-blue.png"];
    }
    cell.lbLName.text=user.LName;
    cell.lbGender.text=user.Gender;
    return cell;
}
- (IBAction)btnEditCancel_Click:(UIStoryboardSegue *)unwindSegue {
    if([unwindSegue.identifier isEqualToString:@"segueCancelEdit"])
    [self.tableView reloadData ];
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
    rowid=(int)indexPath.row;
    [self performSegueWithIdentifier:@"segueEdit" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"segueEdit"])
    {
        EditViewController* VC= (EditViewController* )[segue destinationViewController];
        User *user=[self.listuser objectAtIndex:rowid];
        VC.email=user.Email;
        VC.pass=user.Password;
        VC.lname=user.LName;
        VC.fname=user.FName;
        VC.gender=user.Gender;
        VC.rowid=rowid;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 80;}




@end
