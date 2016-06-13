//
//  SettingPhotoViewController.h
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/19.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingPhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIButton *generateButton;
@property BOOL didSelectedPhoto;

@property NSString * tweetText;

@end
