//
//  SettingViewController.h
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/18.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *commentTextView;
@property (weak, nonatomic) IBOutlet UILabel *restWordsLabel;
@property (weak, nonatomic) IBOutlet UIButton *NextButton;

@property (weak, nonatomic) IBOutlet UIImageView *trumpPhoto;

@property (weak, nonatomic) IBOutlet UILabel *placeHolderLabel;

@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;

@end
