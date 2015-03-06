//
//  LoginViewControllerTest.m
//  Demo
//
//  Created by Ngoc Thong on 3/6/15.
//
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LoginViewController.h"
#import "KNStoryboardManager.h"

@interface LoginViewControllerTest : XCTestCase

@end

@implementation LoginViewControllerTest{
    LoginViewController *LVC;
}

- (void)setUp {
    [super setUp];
    LVC=(LoginViewController*)[KNStoryboardManager getViewControllerWithIdentifier:@"LoginViewController" fromStoryboard:@"Login"];
    [LVC loadView];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

-(void)testLoginButton{
    NSArray *btLoginActions=[LVC.btLogin actionsForTarget:LVC forControlEvent:UIControlEventTouchUpInside];
    XCTAssertNotNil(btLoginActions,@"button Login nil action");
    XCTAssertTrue([[btLoginActions firstObject]isEqualToString:@"bt_login_click:"]);
}

-(void)testSignUpButton{
    NSArray *btSignUpActions=[LVC.btSignUp actionsForTarget:LVC forControlEvent:UIControlEventTouchUpInside];
    XCTAssertNotNil(btSignUpActions,@"button Sign Up nil action");
    XCTAssertFalse([[btSignUpActions firstObject]isEqualToString:@"bt_login_click:"]);
    XCTAssertTrue([[btSignUpActions firstObject]isEqualToString:@"bt_signup_click:"]);

}


-(void)testEmail{
    LVC._tf_email.isEmailField=true;
    
    LVC._tf_email.text=@"abc";
    XCTAssertFalse([LVC._tf_email validate]);
    
    LVC._tf_email.text=@"test1@gmail";
    XCTAssertFalse([LVC._tf_email validate]);
    
    LVC._tf_email.text=@"test1.com";
    XCTAssertFalse([LVC._tf_email validate]);
    
    LVC._tf_email.text=@"@gmail.com";
    XCTAssertFalse([LVC._tf_email validate]);
    
    LVC._tf_email.text=@"test1@gmail.com";
    XCTAssertTrue([LVC._tf_email validate]);
    
    LVC._tf_email.text=@"test1@yahoo.com.vn";
    XCTAssertTrue([LVC._tf_email validate]);
    
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
