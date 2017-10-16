/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 The view controller displays what each icon does on iOS.
 */

#import "RootViewController.h"

#define kTopBottomMargins 20

NSString * const kIconName = @"IconName";
NSString * const kIconDescription = @"IconDescription";
NSString * const kIconCellHeight = @"kIconCellHeight";


@interface RootViewController ()
//! Icon information.
@property (nonatomic, strong) NSArray *icons;
@end


@implementation RootViewController

//| ----------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.icons = @[
       @{kIconName: @"Icon-60@3x",
         kIconDescription: @"Home screen on iPhone with retina HD display",
         kIconCellHeight: @(60)},
       
       @{kIconName: @"Icon-60@2x",
         kIconDescription: @"Home screen on iPhone/iPod Touch with retina display (iOS 7+)",
         kIconCellHeight: @(60)},
       
       @{kIconName: @"Icon-76",
         kIconDescription: @"Home screen on iPad (iOS 7+)",
         kIconCellHeight: @(76)},
       
       @{kIconName: @"Icon-76@2x",
         kIconDescription: @"Home screen on iPad with retina display (iOS 7+)",
         kIconCellHeight: @(76)},
       
       @{kIconName: @"Icon-83.5@2x",
         kIconDescription: @"Home screen on iPad Pro",
         kIconCellHeight: @(83.5)},
       
       @{kIconName: @"Icon-Small-40",
         kIconDescription: @"Spotlight (iOS 7+)",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon-Small-40@2x",
         kIconDescription: @"Spotlight on devices with retina display (iOS 7+)",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon-Small-40@3x",
         kIconDescription: @"Spotlight on devices with retina HD display",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon-Small",
         kIconDescription: @"Spotlight on iPhone/iPod Touch (iOS 6.1 and earlier), and Settings on all devices",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon-Small@2x",
         kIconDescription: @"Spotlight on iPhone/iPod Touch with retina display (iOS 6.1 and earlier), and Settings on all devices with retina display",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon-Small@3x",
         kIconDescription: @"Settings on devices with retina HD display",
         kIconCellHeight: @(40)},
       
       @{kIconName: @"Icon",
         kIconDescription: @"Home screen on iPhone/iPod touch (iOS 6.1 and earlier)",
         kIconCellHeight: @(57)},
       
       @{kIconName: @"Icon@2x",
         kIconDescription: @"Home screen on iPhone/iPod Touch with retina display (iOS 6.1 and earlier)",
         kIconCellHeight: @(57)},
       
       @{kIconName: @"Icon-72",
         kIconDescription: @"Home screen on iPad (iOS 6.1 and earlier)",
         kIconCellHeight: @(72)},
       
       @{kIconName: @"Icon-72@2x",
         kIconDescription: @"Home screen on iPad with retina display (iOS 6.1 and earlier)",
         kIconCellHeight: @(72)},
       
       @{kIconName: @"Icon-Small-50",
         kIconDescription: @"Spotlight on iPad (iOS 6.1 and earlier)",
         kIconCellHeight: @(50)},
       
       @{kIconName: @"Icon-Small-50@2x",
         kIconDescription: @"Spotlight on iPad with retina display (iOS 6.1 and earlier)",
         kIconCellHeight: @(50)},
    ];
}

#pragma mark -
#pragma mark UITableViewDelegate

//| ----------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.icons[indexPath.row][kIconCellHeight] floatValue] + kTopBottomMargins;
}

#pragma mark -
#pragma mark UITableViewDataSource

//| ----------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.icons.count;
}


//| ----------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSString *iconName = self.icons[indexPath.row][kIconName];
    NSString *iconPath = [[NSBundle mainBundle] pathForResource:iconName ofType:@"png"];
    BOOL isRetina = [iconName rangeOfString:@"@2x"].location != NSNotFound;
    BOOL isRetinaHD = [iconName rangeOfString:@"@3x"].location != NSNotFound;
    
    cell.imageView.image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfFile:iconPath] scale:(isRetinaHD ? 3 : (isRetina ? 2 : 1))];
    cell.textLabel.text = [iconName stringByAppendingString:@".png"];
	cell.detailTextLabel.text = self.icons[indexPath.row][kIconDescription];
    
	return cell;
}

@end
