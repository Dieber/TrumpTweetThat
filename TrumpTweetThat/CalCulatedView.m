//
//  CalCulatedView.m
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/19.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import "CalCulatedView.h"

@implementation CalCulatedView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (instancetype)initWithString:(NSString *)string andCustomImage:(UIImage *)customImage
{
    self = [super init];
    if (self) {
        self.customImage = customImage;
        self.string = string;
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    
    NSLog(@"%s",__func__);
    [self drawBasedphoto];
    [self drawTextView:self.string];
    [self drawCustomImage:self.customImage];
    [self drawNextTweetView];
    [self drawBottomPhotoView];
}

-(void)drawTextView:(NSString *)string
{

    
    UITextView * tv = [[UITextView alloc] initWithFrame:CGRectMake(73*2, 410*2, 555, 0)];
    [tv setContentInset:UIEdgeInsetsMake(-10, -6, 0, 0)];
    tv.backgroundColor = [UIColor whiteColor];
    tv.attributedText = [self transFromStringToTwitterString:string];
    tv.frame = CGRectMake(73*2, 410*2, 555, tv.contentSize.height);
    tv.tag = 100;
    [self addSubview:tv];

}

-(NSMutableAttributedString *)transFromStringToTwitterString:(NSString *)string
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 4;
    
    NSDictionary *attributes = @{
    //                             NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:14],
                                 NSFontAttributeName:[UIFont systemFontOfSize:31],
                                 NSParagraphStyleAttributeName:paragraphStyle,
                                 NSForegroundColorAttributeName:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:37/255.0 alpha:1]
                                 };
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc] initWithString:string attributes:attributes];
    if ([attributeString length] <= 1) {
        //Do nothing
    }
    else
    {
        for (int i = 0; i <= [attributeString length] - 2; i++) {
            if (([string characterAtIndex:i] == '@' || [string characterAtIndex:i] == '#') && [string characterAtIndex:i+1] != '#' && [string characterAtIndex:i+1] != '@') {
                for (int j = 1;   (i+j <= [attributeString length] - 1) && ([string characterAtIndex:i+j] != ' ') ; j++) {
                    
                    NSRange range = NSMakeRange(i, j+1);
                    [attributeString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:32/255.0 green:131/255.0 blue:230/255.0 alpha:1] range:range];
                }
            }
        }
    }
    
    return attributeString;

}




-(void)drawCustomImage:(UIImage *)customImage
{
    
    UITextView * tv = [self viewWithTag:100];
    
    NSLog(@"%f",customImage.size.height);
    if (customImage.size.height != 1) {
        customImage = [self image:customImage byScalingToSize:CGSizeMake(555, customImage.size.height*555/customImage.size.width)];
    }
    
    UIImageView * imv = [[UIImageView alloc] initWithFrame:CGRectMake(73*2, 410*2 + tv.frame.size.height, 555, customImage.size.height)];
    imv.contentMode = UIViewContentModeScaleAspectFit;
    [imv setImage:customImage];
    imv.tag = 101;
    
    NSLog(@"_____%s_____",__func__);
    NSLog(@"%lf",imv.frame.size.height);
    
//    [imv sizeToFit];
    
    [self addSubview:imv];
}




-(void)drawNextTweetView
{
    
    UIImageView * upImageView = [self viewWithTag:101];
    
    NSLog(@"_____%s_____",__func__);
    
    NSLog(@"%lf",upImageView.frame.origin.y+upImageView.frame.size.height);
    
    UIImageView * nextTweetImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,upImageView.frame.origin.y+upImageView.frame.size.height, 750, 635)];
    
    nextTweetImageView.image = [UIImage imageNamed:@"NextTweet"];
    
    [self addSubview:nextTweetImageView];
    
}


-(void)drawBottomPhotoView
{
    
    UIImageView * bottomPhotoView = [[UIImageView alloc] initWithFrame:CGRectMake(0,1234, 750, 100)];
    
    bottomPhotoView.image = [UIImage imageNamed:@"bottomphoto.jpg"];
    
    [self addSubview:bottomPhotoView];


}





- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize {
    
    UIImage *sourceImage = image;
    
    UIImage *newImage = nil;
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    
    thumbnailRect.origin = CGPointZero;
    
    thumbnailRect.size.width  = targetSize.width;
    
    thumbnailRect.size.height = targetSize.height;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage ;

}


-(void)drawBasedphoto
{
    UIImageView * imgv = [[UIImageView alloc]initWithFrame:self.frame];
    
    imgv.image = [UIImage imageNamed:@"basedphoto.jpg"];
    
    [self addSubview:imgv];
}


- (UIImage *) imageByRenderingView{
    
    CGFloat oldAlpha = self.alpha;
    
    self.alpha = 1;
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.alpha = oldAlpha;
    
    return resultingImage;
}



@end
