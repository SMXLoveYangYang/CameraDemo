//
//  ViewController.m
//  sharedCamera
//
//  Created by lanouhn on 16/9/12.
//  Copyright © 2016年 SMX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self myButton];
    
}

- (void)myButton
{
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"访问相册" style:UIBarButtonItemStyleDone target:self action:@selector(handleBtnClick:)];
    self.navigationItem.rightBarButtonItem = btn;
    
    
    self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 200, 350, 250)];
    _myImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_myImageView];
}
- (void)handleBtnClick:(UIBarButtonItem *)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    [self presentViewController:imagePicker animated:YES completion:^{
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
    }];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.myImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
