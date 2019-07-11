//
//  ViewController.m
//  方法交换
//
//  Created by 赵鹏 on 2019/7/11.
//  Copyright © 2019 赵鹏. All rights reserved.
//

/**
 UIButton类是继承自UIControl类的。当按钮有点击事件的时候，系统会先自动调用UIControl类里面的"- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event;"方法，然后才会调用按钮的"- (void)addTarget:(nullable id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;"方法了。所以想要拦截所有的按钮的点击事件的话，就要撰写一个分类，然后在这个分类里面的load方法中利用Runtime的方法交换API来把原来的"- (void)sendAction:(SEL)action to:(nullable id)target forEvent:(nullable UIEvent *)event;"方法替换成自己想实现的方法，这样就达到了拦截所有按钮点击事件的目的了。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickBtn
{
    NSLog(@"%s", __func__);
}

- (IBAction)clickBtn1
{
    NSLog(@"%s", __func__);
}

- (IBAction)clickBtn2
{
    NSLog(@"%s", __func__);
}

@end
