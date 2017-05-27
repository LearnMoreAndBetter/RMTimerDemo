//
//  FirstVC.m
//  RMTimer
//
//  Created by 王林 on 2017/5/26.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import "FirstVC.h"
#import "RMTimer.h"

//主色调－－深绿
#define CETC_MAIN_COLOR       [UIColor colorWithRed:44 / 255.0 green:183 / 255.0 blue:124 / 255.0 alpha:1]
//文字色- - 灰色
#define  CETC_GRAY_COLOR       [UIColor colorWithRed:138 / 255.0 green:138 / 255.0 blue:138 / 255.0 alpha:1]

@interface FirstVC ()

@property(nonatomic, strong)UIButton *getVerificationButton;

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	self.title = @"FirstVC";
	[self.view addSubview:self.getVerificationButton];
	
}

- (void)getSMSCode{
	RMTimer *sharedTimer = [RMTimer sharedTimer];
	[sharedTimer resumeTimerWithDuration:60 interval:1 handleBlock:^(NSInteger currentTime) {
		//倒计时页面处理
		NSString *timeSecend = [NSString stringWithFormat:@"重新发送(%ld)",currentTime];
		[self.getVerificationButton setTitle:timeSecend forState:UIControlStateNormal];
		[self.getVerificationButton setTitleColor:CETC_GRAY_COLOR forState:UIControlStateNormal];
		self.getVerificationButton.layer.borderColor = CETC_GRAY_COLOR.CGColor;

		//计时器件不允许点击
		self.getVerificationButton.userInteractionEnabled = NO;
		
	} timeOutBlock:^{
		[self.getVerificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
		[self.getVerificationButton setTitleColor:CETC_MAIN_COLOR forState:UIControlStateNormal];
		self.getVerificationButton.layer.borderColor = CETC_MAIN_COLOR.CGColor;
		self.getVerificationButton.layer.cornerRadius = 2;
		self.getVerificationButton.layer.masksToBounds = YES;
		self.getVerificationButton.userInteractionEnabled = YES;
	}];
}


- (UIButton *)getVerificationButton{
	if (!_getVerificationButton)
	{
		_getVerificationButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 100	,300, 200)];
		[_getVerificationButton setTitleColor:CETC_MAIN_COLOR forState:UIControlStateNormal];
		_getVerificationButton.layer.cornerRadius = 3.0;
		_getVerificationButton.layer.borderWidth = 1.0;
		_getVerificationButton.layer.borderColor = CETC_MAIN_COLOR.CGColor;
		_getVerificationButton.layer.masksToBounds = YES;
		[_getVerificationButton.titleLabel setFont: [UIFont systemFontOfSize:13]];
		[_getVerificationButton setTitle:@"获取验证码" forState:UIControlStateNormal];
		[_getVerificationButton addTarget:self action:@selector(getSMSCode) forControlEvents:UIControlEventTouchUpInside];
	}
	return _getVerificationButton;
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
