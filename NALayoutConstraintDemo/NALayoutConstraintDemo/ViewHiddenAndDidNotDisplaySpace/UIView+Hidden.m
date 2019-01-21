//
//  UIView+Hidden.m
//  NALayoutConstraintDemo
//
//  Created by 王民 on 2019/1/11.
//  Copyright © 2019 Minger. All rights reserved.
//

#import "UIView+Hidden.h"
#import <objc/runtime.h>
#import "NSLayoutConstraint+Hidden.h"

@implementation UIView (Hidden)

-(BOOL)hiddenAndDidNotDisplaySpace {
    return  [objc_getAssociatedObject(self, @selector(hiddenAndDidNotDisplaySpace)) boolValue];
}

-(void)setHiddenAndDidNotDisplaySpace:(BOOL)hiddenAndDidNotDisplaySpace {
    // 先把数据动态绑定下来
    objc_setAssociatedObject(self, @selector(hiddenAndDidNotDisplaySpace), @(hiddenAndDidNotDisplaySpace), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // hidden 属性开始设置
    self.hidden =  hiddenAndDidNotDisplaySpace;
    
    // 然后开始设置其约束。 在本view 中的空间约束不用考虑吧，因为本view都hidden ,则其subviews 也都不会显示。
    [self hideConstraintsForTargetView:self];
    
}

// 这里要将target view 当做参数传进来。为什么：
// 因为这里targetview 传进来就是为了对约束constraint 的firstItem和secondItem 判断是不是targetView，主要作用就是标志作用。
- (void) hideConstraintsForTargetView:(UIView *)targetView {
    // 这里拿到的是自身的constraints ,为什么不拿targetView的constraints
    // 因为这里
    for (NSLayoutConstraint *constraint in self.constraints) {
        
        // firstItem 是要进行约束的视图
        // secondItem 是被参照的视图
        BOOL isFirstItem = [constraint.firstItem isEqual:targetView];
        BOOL isSeconsItem = [constraint.secondItem isEqual:targetView];
       
        // 如果要进行约束的视图和被参照的视图都不是targetView,那么这个约束是其他的约束，和targetview 无关，直接跳过判断下一条即可。
        if(!(isFirstItem || isSeconsItem)) {
            continue;
        }
        
        //targetview 是被约束的视图
        if (isFirstItem){
            NSLayoutAttribute attribute = constraint.firstAttribute;
            if (attribute == NSLayoutAttributeWidth ||
                attribute == NSLayoutAttributeHeight) {
                constraint.collapsed = targetView.hiddenAndDidNotDisplaySpace;
            }
        } else {  //targetview 是被参照视图
            constraint.collapsed = targetView.hiddenAndDidNotDisplaySpace;
        }
    }
    
    [self.superview hideConstraintsForTargetView:targetView];
    [self.superview layoutSubviews];
}


@end
