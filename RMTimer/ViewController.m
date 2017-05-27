//
//  ViewController.m
//  RMTimer
//
//  Created by 王林 on 2017/5/26.
//  Copyright © 2017年 wanglin. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"

@interface ViewController ()

@property(nonatomic, strong)UIButton *firstButton;
@property(nonatomic, strong)UIButton *secondButton;
@property(nonatomic, strong)UIButton *thirdButton;

@property(nonatomic, strong)FirstVC *firstVC;
@property(nonatomic, strong)SecondVC *secondVC;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	[self.view addSubview:self.firstButton];
	[self.view addSubview:self.secondButton];
	[self.view addSubview:self.thirdButton];
	
}

- (void)buttonAction:(UIButton *)button{
	if (button.tag == 101) {
		[self.navigationController pushViewController:self.firstVC animated:YES];
	}

	if (button.tag == 102) {
		[self.navigationController pushViewController:self.secondVC animated:YES];
	}
	
	if (button.tag == 103) {
		ThirdVC *vc = [[ThirdVC alloc]init];
		[self.navigationController pushViewController:vc animated:YES];
	}
}

//懒加载形式，保持每次进入的都是相同的VC，以保证VC中修改的都是同一个button
- (FirstVC *)firstVC{
	if (!_firstVC) {
		_firstVC =  [[FirstVC alloc]init];
	}
	return _firstVC;
}

- (SecondVC *)secondVC{
	if (!_secondVC) {
		_secondVC =  [[SecondVC alloc]init];
	}
	return _secondVC;
}

- (UIButton *)firstButton{
	if (!_firstButton)
	{
		UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 100, 300, 60)];
		button.tag = 101;
		[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
		button.layer.cornerRadius = 3.0;
		button.layer.borderWidth = 1.0;
		button.layer.borderColor = [UIColor redColor].CGColor;
		button.layer.masksToBounds = YES;
		[button.titleLabel setFont: [UIFont systemFontOfSize:15]];
		[button setTitle:@"First VC" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		_firstButton = button;
	}
	return _firstButton;
}

- (UIButton *)secondButton{
	if (!_secondButton)
	{
		UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 200, 300, 60)];
		button.tag = 102;
		[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
		button.layer.cornerRadius = 3.0;
		button.layer.borderWidth = 1.0;
		button.layer.borderColor = [UIColor redColor].CGColor;
		button.layer.masksToBounds = YES;
		[button.titleLabel setFont: [UIFont systemFontOfSize:15]];
		[button setTitle:@"second VC" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		_secondButton = button;
	}
	return _secondButton;
}

- (UIButton *)thirdButton{
	if (!_thirdButton)
	{
		UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 300, 300, 60)];
		button.tag = 103;
		[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
		button.layer.cornerRadius = 3.0;
		button.layer.borderWidth = 1.0;
		button.layer.borderColor = [UIColor redColor].CGColor;
		button.layer.masksToBounds = YES;
		[button.titleLabel setFont: [UIFont systemFontOfSize:15]];
		[button setTitle:@"third VC" forState:UIControlStateNormal];
		[button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
		_thirdButton = button;
	}
	return _thirdButton;
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
