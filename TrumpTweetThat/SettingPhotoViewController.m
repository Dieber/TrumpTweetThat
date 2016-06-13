//
//  SettingPhotoViewController.m
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/19.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import "SettingPhotoViewController.h"
#import "CompleteViewController.h"
#import "CalCulatedView.h"
@interface SettingPhotoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

{
    UIImagePickerController *pickerCon;
    CalCulatedView * ccv ;
}

@end

@implementation SettingPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer * singleTap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userClickedThePhoto)];
    _didSelectedPhoto = NO;
    _photoImageView.userInteractionEnabled = YES;
    [_photoImageView addGestureRecognizer:singleTap];
    _generateButton.layer.cornerRadius = 10;
}

- (void)viewWillAppear:(BOOL)animated
{
    if (_photoImageView.image == nil) {
        _photoImageView.image = [UIImage imageNamed:@"plus"];
    }

}

-(void)userClickedThePhoto
{
    NSLog(@"%s",__func__);

//判断当前支持相机打开还是相册打开
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

//        [self OpenPicker:UIImagePickerControllerSourceTypeCamera];
//    }else

    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        [self OpenPicker:UIImagePickerControllerSourceTypePhotoLibrary];
    }else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]){
        [self OpenPicker:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}

- (IBAction)generateButtonOnClicked:(id)sender {
    
    

    UIStoryboard * sy =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    if (_didSelectedPhoto == NO) {
        self.photoImageView.image = nil;
    }
    
    ccv = [[CalCulatedView alloc] initWithString:self.tweetText andCustomImage: self.photoImageView.image];
        
    ccv.frame = CGRectMake(0, 0, 750, 1334);  //iPhone6屏幕尺寸
 
    ccv.backgroundColor = [UIColor whiteColor];
    UIImageView * imgv = [[UIImageView alloc]initWithFrame:ccv.frame];
    imgv.image = [UIImage imageNamed:@"basedphoto"];
    
    
    [ccv addSubview:imgv];
    
    
    UIImage * image = [[UIImage alloc] init];  //UIImage
    
    image = ccv.imageByRenderingView;     //转换图片
    
    ccv.customImage = image;
    
    
    
    CompleteViewController * cvc = [sy instantiateViewControllerWithIdentifier:@"ccvc"];

    [self performSelector:@selector(ttt:) withObject:cvc afterDelay:0.2];
    
    [self.navigationController pushViewController:cvc animated:YES ];
    
}

- (void) ttt:(CompleteViewController *)vc
{
    [vc.calculatedImageView setImage:ccv.customImage];
    NSLog(@"%@",vc.calculatedImageView);
}
-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)valueChanged:(id)sender {
    
    
}







-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //info 系统将用户操作的媒体文件 回传
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.photoImageView.image = image;
    _didSelectedPhoto = YES;
    [pickerCon dismissViewControllerAnimated:YES completion:nil];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [pickerCon dismissViewControllerAnimated:YES completion:nil];
}

-(void)OpenPicker:(UIImagePickerControllerSourceType)type{
    pickerCon = [[UIImagePickerController alloc]init];
    pickerCon.sourceType = type;
    pickerCon.delegate = self;
    [self presentViewController:pickerCon animated:YES completion:nil];
    

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
