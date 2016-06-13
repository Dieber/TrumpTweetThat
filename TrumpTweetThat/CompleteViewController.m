//
//  CompleteViewController.m
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/19.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import "CompleteViewController.h"

@interface CompleteViewController ()

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    
    UILongPressGestureRecognizer * longTap =[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(userLongTapThePhoto:)];
    
    _calculatedImageView.userInteractionEnabled = YES;
    [_calculatedImageView addGestureRecognizer:longTap];
    _authorButton.layer.cornerRadius = 10;
}

-(void)userLongTapThePhoto:(UILongPressGestureRecognizer *)longPress
{
    NSLog(@"single click %@",[_calculatedImageView image]);
    if (longPress.state == UIGestureRecognizerStateBegan) {
        UIImageWriteToSavedPhotosAlbum([_calculatedImageView image], nil, nil, nil);
        
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"存储照片成功"
                                                        message:@"您已将照片存储于图片库中，打开照片程序即可查看。"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }else {

    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
