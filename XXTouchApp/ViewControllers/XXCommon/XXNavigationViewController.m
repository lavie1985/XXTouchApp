//
//  XXNavigationViewController.m
//  XXTouchApp
//
//  Created by Zheng on 8/29/16.
//  Copyright © 2016 Zheng. All rights reserved.
//

#import "AppDelegate.h"
#import "XXNavigationViewController.h"
#import "XXLocalNetService.h"

static NSString * const tmpLockedItemPath = @"/private/var/tmp/1ferver_need_respring";

@interface XXNavigationViewController ()

@end

@implementation XXNavigationViewController

#pragma mark - Status Bar Style

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self checkNeedsRespring];
    [[AppDelegate globalDelegate] setRootViewController:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkNeedsRespring {
    self.view.backgroundColor = [UIColor whiteColor];
    if ([FCFileManager existsItemAtPath:tmpLockedItemPath]) {
        self.view.userInteractionEnabled = NO;
        @weakify(self);
        SIAlertView *alertView = [[SIAlertView alloc] initWithTitle:XXLString(@"Needs Respring") andMessage:XXLString(@"You should resping your device to continue to use this application.")];
        [alertView addButtonWithTitle:XXLString(@"Respring Now") type:SIAlertViewButtonTypeDestructive handler:^(SIAlertView *alertView) {
            @strongify(self);
            [self.view makeToastActivity:CSToastPositionCenter];
            [XXLocalNetService killBackboardd];
        }];
        [alertView show];
    }
}

- (void)handleShortCut:(NSString *)type {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        if ([type isEqualToString:@"Launch"]) {
            SendConfigAction([XXLocalNetService localLaunchSelectedScriptWithError:&err], nil);
        } else if ([type isEqualToString:@"Stop"]) {
            SendConfigAction([XXLocalNetService localStopCurrentRunningScriptWithError:&err], nil);
        } else if ([type isEqualToString:@"Scan"]) {
            
        }
    });
}

@end