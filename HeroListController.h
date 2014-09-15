//
//  HeroListController.h
//  SuperDB
//
//  Created by ZengYifei on 14-4-19.
//  Copyright (c) 2014年 ZengYifei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeroDetailController.h"
@interface HeroListController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITabBarDelegate,NSFetchedResultsControllerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *heroTableView;
@property (weak, nonatomic) IBOutlet UITabBar *heroTabBar;
- (IBAction)addHero:(id)sender;
#define kSelectedTabDefaultsKey @"Selected Tab"
enum {
    kByName,
    kBySecretIdentity,
};
@end
