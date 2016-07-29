//
//  ViewController.m
//  倒计时time
//
//  Created by chuangqu on 16/7/29.
//  Copyright © 2016年 mr.liu. All rights reserved.
//

#import "ViewController.h"
#import "LXPcountdownbutton.h"
@interface ViewController (){
    LXPcountdownbutton *button;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    button = [LXPcountdownbutton shareInstance];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"计时器" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(beginTimer) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(100, 100, 80, 40)];
    [self.view addSubview:button];
    button.formatStr=@"还剩%zd秒了";
    /*这个方法 */
//    [button setcountdowntimeWithbutton:10 timebuttonstus:^(Buttonstatus stats) {
//        
//    }];
    [button setcountdowntimeWithbutton:50 runningColor:[UIColor grayColor] runningTextcolor:[UIColor whiteColor] runingImgName:@"1weixin1" formatStr:@"还剩%zd秒了" lxpbuttonblock:^(Buttonstatus stats) {
        
        
        if (stats==Button_running) {
            //计时中
        }else if (stats==Button_cancle){
            //结束了（手动结束了，没有超时）
        }else if (stats==Button_Did){
            //计时结束了 超时了
        }

    }];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)beginTimer{
    [[LXPcountdownbutton shareInstance] beginTimers];
}


@end
