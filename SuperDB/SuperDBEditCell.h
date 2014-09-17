//
//  SuperDBEditCell.h
//  SuperDB
//
//  Created by ZengYifei on 14-9-15.
//  Copyright (c) 2014年 ZengYifei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuperDBEditCell : UITableViewCell
@property (strong,nonatomic) UILabel * label;
@property (strong,nonatomic) UITextField * textField;

@property (strong,nonatomic) NSString * key;
@property (strong,nonatomic) id value;
@end
