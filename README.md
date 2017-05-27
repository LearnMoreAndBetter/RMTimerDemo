# RMTimerDemo
定时器封装

本项目中对两种定时器进行了封装，dispatch_source_t和NSTimer

关于这两个定时器，还是有点区别的：
使用NSTimer 常常会不准时,因为它被添加到RunLoop,而RunLoop要处理的事情比较多,包括source,timer,observer,所以时间上总是偏差也是正常.

那么如果对时间要求比较严格的话,可以使用GCD定时器代替.因为GCD定时器不受RunLoop影响.
dispatch_source_t精度很高，系统自动触发，系统级别的源。


RMTimer ： GCD定时器
调用方法
/**
定时器

@param duration 持续时间
@param interval 间隔时间
@param handleBlock 倒计时的Block处理
@param timeOutBlock 倒计时结束block处理
*/
- (void)resumeTimerWithDuration:(NSInteger)duration
						interval:(NSInteger)interval
					handleBlock:(void(^)(NSInteger currentTime))handleBlock
					timeOutBlock:(void(^)())timeOutBlock;


RMCommonTimer ： NSTimer定时器
调用方法
/**
倒计时的Block处理
*/
@property (copy, nonatomic)RMHandleBlock handleBlock;

/**
倒计时结束block处理
*/
@property (copy, nonatomic)RMTimeOutBlock timeoutBlock;

/**
定时器

@param duration 持续时间
@param interval 间隔时间
*/
- (void)resumeTimerWithDuration:(NSInteger)duration
						interval:(NSInteger)interval;

VC
FirstVC和ThirdVC中使用的是GCD定时器，SecondVC中使用的是NSTimer定时器，可以看一下效果，还是有一点变化的，SecondVC会等待一个interval页面才发生改变
FirstVC和ThirdVC,前者返回上一页再次进入，倒计时依旧进行，后者是一个新的页面
这是因为在VC中加了点东西：
//懒加载形式，保持每次进入的都是相同的VC，以保证VC中修改的都是同一个button
- (FirstVC *)firstVC{
	if (!_firstVC) {
		_firstVC =  [[FirstVC alloc]init];
	}
	return _firstVC;
}


