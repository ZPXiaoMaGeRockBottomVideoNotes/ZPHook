//
//  UIControl+ZPExtension.m
//  方法交换
//
//  Created by 赵鹏 on 2019/7/11.
//  Copyright © 2019 赵鹏. All rights reserved.
//

#import "UIControl+ZPExtension.h"
#import <objc/runtime.h>

@implementation UIControl (ZPExtension)

+ (void)load
{
    /**
     hook：钩子函数；
     "class_getInstanceMethod"方法的第一个参数不一定要写self，要看实际上是什么类型。比如NSMutableArray类的实例对象，它的实际类型不是NSMutableArray而是"__NSArrayM"。这种表面上是一种类型，而实际上是另外一种类型的类叫做“类簇”。NSString、NSArray、NSDictionary，都是类簇，他们的真实类型是其他类型。
     */
    Method method = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
    Method method1 = class_getInstanceMethod(self, @selector(zp_sendAction:to:forEvent:));
    
    method_exchangeImplementations(method, method1);
}

- (void)zp_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    //调用系统原来的实现
    [self zp_sendAction:action to:target forEvent:event];
    
    //拦截所有的按钮事件，然后按照自己的想法撰写代码
    if ([self isKindOfClass:[UIButton class]])
    {
        NSLog(@"%@-%@-%@", self, target, NSStringFromSelector(action));
    }
}

@end
