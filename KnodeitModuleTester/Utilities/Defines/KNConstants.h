//
//  KNConstants.h
//  EverAfter
//
//  Created by Jianying Shi on 6/20/14.
//
//

#import <Foundation/Foundation.h>


// Constants for API

//#define kBaseURL                    "http://poc.yourdeveloper.net/api"
//
//#define kAPIRegisterMobile          @kBaseURL"/user/mobile"
//#define kAPILogin                   @kBaseURL"/user/login"
#define kAPIRegister                kBaseURL"/user/register"
//#define kAPICheckExistance          @kBaseURL"/mobile/existance"
//#define kAPIRegisterDeviceToken     @kBaseURL"/user/token"
//#define kAPIUpload                  @kBaseURL"/feed/upload"

#define kWebURL                     "http://192.168.1.26:4000"
#define kBaseURL                    @kWebURL"/api/v1"

#define kAPIRegisterMobile          kBaseURL"/user/mobile"
#define kAPILogin                   kBaseURL"/auth/sign_in"
#define kAPISignUp                  kBaseURL"/auth/sign_up"
#define kAPICheckExistance          kBaseURL"/mobile/existance"
#define kAPIRegisterDeviceToken     kBaseURL"/user/token"
#define kAPIUpload                  kBaseURL"/feed/upload"

#define kAPIProfile                 kBaseURL"/profiles"



#define kNetworkError               @"Network connection error"

// Constants for Register Mobile
#define kMinimumPhoneNumbers        10
#define kIncompletePhoneNumber      @"Please enter your complete phone number with country code"
#define kPhoneNumberDidNotRegister  @"Phone number did not register, please try again"

#define kSqliteName                 @"EverAfter.sqlite"


// User defaults
#define kItemNameKeychainPassowrd   @"EverAfterUserPassword"
#define kRememberPassword           @"Remember This User"
#define kDeviceTokenKeyname         @"devicetoken"

// Notifications
#define kFriendChanged              @"Friend Changed"
#define kLoginSuccessed             @"Login Successed"
#define kLoginFailed                @"Login Failed"
#define kReceivedMessage            @"Received Message"
#define kImageSent                  @"Image Sent"
#define kApplicationLoadFinished    @"Application load finished"

// Splash constants
#define kDefaultTimeToLiveSplash    3.0f   // unit: seconds
#define kTimerIntervalSplash        0.5f    // unit: seconds


// View controller storyboard IDs
#define kMainStoryboardName_iPhone              @"Main_iPhone"
#define kMainStoryboardName_iPad                @"Main_iPad"
#define kSplashControllerIdentifier             @"spalshNavController"
#define kLandingControllerIdentifier            @"landingNavController"
#define kHomeControllerIdentifier               @"homeTabbarController"

// Segue IDs
#define kSegueIDFromSplashToHome                @"segueFromSplashToHome"
#define kSegueIDFromSplashToLanding             @"segueFromSplashToLanding"

#define kDefaultMessageBody                     @"I'm using EverAfter, a great application to share precious moments with your friends. Follow this link to download it from the appstore"