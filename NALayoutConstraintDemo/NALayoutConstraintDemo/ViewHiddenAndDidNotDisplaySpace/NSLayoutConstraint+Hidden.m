//
//  NSLayoutConstraint+Hidden.m
//  NALayoutConstraintDemo
//
//  Created by 王民 on 2019/1/11.
//  Copyright © 2019 Minger. All rights reserved.
//

#import "NSLayoutConstraint+Hidden.h"
#import <objc/runtime.h>

@implementation NSLayoutConstraint (Hidden)

- (CGFloat)originalValue {
    return [objc_getAssociatedObject(self, @selector(originalValue)) floatValue];
}

- (void)setOriginalValue:(CGFloat)originalValue {
    objc_setAssociatedObject(self, @selector(originalValue), @(originalValue), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (BOOL)collapsed {
    return [objc_getAssociatedObject(self, @selector(collapsed)) boolValue];
}

-(void)setCollapsed:(BOOL)collapsed {
    objc_setAssociatedObject(self, @selector(collapsed), @(collapsed), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 先对原来的约束数值进行保存
    if(self.originalValue==0) {
        self.originalValue = self.constant;
    }
    self.constant = collapsed ? 0 : self.originalValue;
}

@end
