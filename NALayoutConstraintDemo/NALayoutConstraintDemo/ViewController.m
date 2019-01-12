//
//  ViewController.m
//  NALayoutConstraintDemo
//
//  Created by 王民 on 2019/1/11.
//  Copyright © 2019 Minger. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Hidden.h"
#import "Masonry.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel  *label6;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = 1006;
    btn.backgroundColor = UIColor.blueColor;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo((UIView *)[self.view viewWithTag:1004].mas_bottom).offset(30);
        make.width.height.mas_equalTo(40);
    }];
    
    
    self.label6 = [[UILabel alloc]init];
    self.label6.tag = 106;
    self.label6.backgroundColor = UIColor.blueColor;
    [self.view addSubview:self.label6];
    [self.label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo([self.view viewWithTag:105].mas_right).offset(-100);
        make.top.mas_equalTo([self.view viewWithTag:105].mas_bottom).offset(50);
        make.width.height.mas_equalTo(50);
    }];
}
- (IBAction)btnAction:(UIButton *)sender {
    UILabel *label = [self.view viewWithTag:sender.tag - 1000 + 100];
    label.text = label.text.length ? @"": [NSString stringWithFormat:@"TestLabel%ld",label.tag - 100];
    label.hiddenAndDidNotDisplaySpace = label.text.length == 0;
}



@end
