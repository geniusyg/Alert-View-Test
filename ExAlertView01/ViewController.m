//
//  ViewController.m
//  ExAlertView01
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(1==alertView.tag) {
		if(alertView.cancelButtonIndex == buttonIndex) {
			NSLog(@"취소");
		} else if(alertView.firstOtherButtonIndex == buttonIndex) {
			NSLog(@"선택1");
		} else if(alertView.firstOtherButtonIndex+1 == buttonIndex) {
			NSLog(@"선택2");
		}
	} else if(2==alertView.tag) {
		if(alertView.firstOtherButtonIndex == buttonIndex) {
			UITextField *idf = [alertView textFieldAtIndex:0];
			UITextField *pwf = [alertView textFieldAtIndex:1];
			NSLog(@"ID : %@ / PW : %@",idf.text, pwf.text);
		} else {
			NSLog(@"로그인 취소!");
		}
	} else {
		NSLog(@"기타처리");
	}
}

-(BOOL)alertViewSholdEnableFirstOtherButton:(UIAlertView *)alertView {
	if(2==alertView.tag) {
		UITextField *idf = [alertView textFieldAtIndex:0];
		UITextField *pwf = [alertView textFieldAtIndex:1];
		
		return ([idf.text length]>3 && [pwf.text length]>3);
	}
	return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)basicAlert:(id)sender {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"제목" message:@"메시지" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"확인", nil];
	alert.tag = 1;
	[alert show];
}
- (IBAction)alertWithInput:(id)sender {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"로그인" message:@"아이디와 비밀번호를 입력해" delegate:self cancelButtonTitle:@"취소" otherButtonTitles:@"선택1",@"선택2", nil];
	alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
	alert.tag = 2;
	[alert show];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end











