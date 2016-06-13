//
//  SettingViewController.m
//  TrumpTweetThat
//
//  Created by Dieber on 16/5/18.
//  Copyright © 2016年 Dieber. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingPhotoViewController.h"
#define OFFSET_OF_LENGTH (kbSize.height - ([UIScreen mainScreen].bounds.size.height-(_restWordsLabel.frame.origin.y+_restWordsLabel.frame.size.height)))

@interface SettingViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImagePickerController *pickerCon;
    CGSize kbSize;
    float phone4SizeOffset;
    BOOL isPushUpTheKeyBoard;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
    _commentTextView.layer.borderColor = [UIColor colorWithRed:44/255.0 green:78/255.0 blue:113/255.0 alpha:1].CGColor;
    isPushUpTheKeyBoard = NO;
    _commentTextView.layer.borderWidth = 1;
    _commentTextView.layer.cornerRadius = 10;
    _placeHolderLabel.tintColor = [UIColor grayColor];
    _placeHolderLabel.text = @"支持@ #变色，切勿发表违反当地法律法规的言论，此应用仅供娱乐，切勿为传谣而使用。";
    _placeHolderLabel.enabled = NO;
    _NextButton.layer.cornerRadius = 10;
    
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (_commentTextView.text.length == 0) {
        _placeHolderLabel.tintColor = [UIColor grayColor];
        _placeHolderLabel.text = @"支持@ #变色，切勿发表违反当地法律法规的言论，此应用仅供娱乐，切勿为传谣而使用。";
    }
    
    else
    {
        _placeHolderLabel.text = @"";

        if (_commentTextView.text.length >= 140)
        {
            _commentTextView.tintColor = [UIColor blackColor];
            _commentTextView.text = [_commentTextView.text substringToIndex:140];
        }
    }
    
    _restWordsLabel.text = [NSString stringWithFormat:@"还可输入%lu个字",(unsigned long)140-(_commentTextView.text.length)];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)onClicked:(id)sender {
    UIStoryboard * sy =[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingPhotoViewController * spvc = [sy instantiateViewControllerWithIdentifier:@"llsy"];
    spvc.tweetText = _commentTextView.text;
    [self.navigationController pushViewController:spvc animated:YES ];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (![self.commentTextView isExclusiveTouch]) {
        isPushUpTheKeyBoard = NO;

        [UIView animateWithDuration:0.3 animations:^{
            
            _commentTextView.transform =CGAffineTransformIdentity;
            _restWordsLabel.transform =CGAffineTransformIdentity;

            _titleImageView.alpha = 1;
            _trumpPhoto.transform = CGAffineTransformIdentity;
            _placeHolderLabel.transform = CGAffineTransformIdentity;
            
            
            
//            _commentTextView.transform = CGAffineTransformMakeTranslation(0, 0);
//            _restWordsLabel.transform = CGAffineTransformMakeTranslation(0, 0);
//            _titleImageView.alpha = 1;
//            _trumpPhoto.transform = CGAffineTransformMakeTranslation(0, 0);
//            _placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, 0);
            
            

        }];
        [self.commentTextView resignFirstResponder];
    }
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        isPushUpTheKeyBoard = NO;
        [UIView animateWithDuration:0.3 animations:^{
            _commentTextView.transform =CGAffineTransformIdentity;
            _restWordsLabel.transform =CGAffineTransformIdentity;
            
            _titleImageView.alpha = 1;
            _trumpPhoto.transform = CGAffineTransformIdentity;
            _placeHolderLabel.transform = CGAffineTransformIdentity;

//            if ([UIScreen mainScreen].bounds.size.height == 480) {
//
//            }
//            
//            
//            
//            textView.transform = CGAffineTransformMakeTranslation(0, 0);
//            _restWordsLabel.transform = CGAffineTransformMakeTranslation(0, 0);
//            _titleImageView.alpha = 1;
//            _trumpPhoto.transform = CGAffineTransformMakeTranslation(0, 0);
//            _placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

//-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
//{
//
//    NSLog(@"%f",textView.frame.origin.y);
//    [UIView animateWithDuration:0.3 animations:^{
//        textView.transform = CGAffineTransformMakeTranslation(0, -100);
//    }];
//    NSLog(@"%f",textView.frame.origin.y);
//    return  YES;
//
//}



- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
}


- (void)keyboardWasShown:(NSNotification*)aNotification
{
    if (isPushUpTheKeyBoard == NO)
    {
        isPushUpTheKeyBoard = YES;
        NSLog(@"%f",_trumpPhoto.frame.origin.y);
        NSDictionary* info = [aNotification userInfo];
        kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;//得到鍵盤的高度
        [UIView animateWithDuration:0.3 animations:^{
            if ([UIScreen mainScreen].bounds.size.height == 480) {
                
                _trumpPhoto.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH - 7 - 30);
                _placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH - 7);
                
                _commentTextView.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH - 7);
                
                _restWordsLabel.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH -70 - 135);
                _titleImageView.alpha = 0;
            }
            else
            {
                _trumpPhoto.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH-67-30);
                _placeHolderLabel.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH-67);
                _commentTextView.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH-67);
                _restWordsLabel.transform = CGAffineTransformMakeTranslation(0, -OFFSET_OF_LENGTH-67);
                _titleImageView.alpha = 0;
            }
        }];
    }
//    if ([UIScreen mainScreen].bounds.size.height == 480) {
//        _commentTextView.transform = CGAffineTransformMakeScale(1, 0.5);
//    }

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
