//
//  CalCulatedView.h
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/19.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalCulatedView : UIView

@property NSString * string;
@property NSArray * wordsArray;
@property UIImage * customImage;
-(instancetype)initWithString:(NSString *)string andCustomImage:(UIImage *)customImage;
- (UIImage *) imageByRenderingView;

-(void)drawBasedphoto;

-(void)drawTextView:(NSString *)string;

-(void)drawNextTweetView;


-(void)drawBottomPhotoView;

-(NSMutableAttributedString *)transFromStringToTwitterString:(NSString *)string;

- (float) heightForString:(UITextView *)textView andWidth:(float)width;

-(void)drawCustomImage:(UIImage *)customImage;

- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;


@end
