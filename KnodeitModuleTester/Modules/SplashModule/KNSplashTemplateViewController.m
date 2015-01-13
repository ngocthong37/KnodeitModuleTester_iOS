//
//  KNSplashTemplateViewController.m
//  EverAfter
//
//  Created by Jianying Shi on 6/26/14.
//
//

#import "KNSplashTemplateViewController.h"
#import "KNConstants.h"

@interface KNSplashTemplateViewController ()

@property(nonatomic,strong) NSTimer * timerSplashKill;

@end

@implementation KNSplashTemplateViewController
{
    CGFloat accumlateTime;
}
- (id) init
{
    self = [super init];
    if ( self ){
        self.timeToLive = kDefaultTimeToLiveSplash;        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.timeToLive = kDefaultTimeToLiveSplash;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if ( self ) {
        self.timeToLive = kDefaultTimeToLiveSplash;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onShouldCloseSplash:) name:kApplicationLoadFinished object:nil];
    self.timerSplashKill = [NSTimer scheduledTimerWithTimeInterval:kTimerIntervalSplash target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
    
    accumlateTime = 0;
    
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kApplicationLoadFinished object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Customize methods

- (NSString*) getSegueNameForNext
{
    return kSegueIDFromSplashToLanding;
}

#pragma mark - timer
- (void) onTimer:(id)sender
{
    accumlateTime += kTimerIntervalSplash;
    if ( accumlateTime >=self.timeToLive ){ // Timer expired
        [self.timerSplashKill invalidate];
        self.timerSplashKill = nil;
        [self goNext:nil];
    }
}

#pragma mark - Notifications

- (void) onShouldCloseSplash:(NSNotification*) notification
{
    [self goNext:notification];
}

#pragma mark - Actions
- (void) goNext:(id)sender
{
    if ( self.timerSplashKill )
    {
        [self.timerSplashKill invalidate];
        self.timerSplashKill = nil;
    }
    
    [self performSegueWithIdentifier:[self getSegueNameForNext] sender:self];
}
@end
