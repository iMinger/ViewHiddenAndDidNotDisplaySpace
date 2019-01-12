//
//  NSLayoutConstraint+Hidden.h
//  NALayoutConstraintDemo
//
//  Created by 王民 on 2019/1/11.
//  Copyright © 2019 Minger. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (Hidden)

@property (assign, nonatomic) CGFloat originalValue;  // 记录该constraint 的原始值，等约束有效的时候复原约束值
@property (assign, nonatomic) BOOL collapsed;  // 约束失效
@end

NS_ASSUME_NONNULL_END
