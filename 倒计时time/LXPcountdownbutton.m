//
//  LXPcountdownbutton.m
//  倒计时time
//
//  Created by chuangqu on 16/7/29.
//  Copyright © 2016年 mr.liu. All rights reserved.
//

#import "LXPcountdownbutton.h"
#import <objc/runtime.h>
static LXPcountdownbutton *sharedInstance;
static void *lxpstsusblock = @"lxpstsusblock";
@implementation LXPcountdownbutton

+(LXPcountdownbutton*)shareInstance{

    static dispatch_once_t LXPbuttonToken;
    dispatch_once(&LXPbuttonToken, ^{
        
    sharedInstance = [[[self class] alloc] init];

    });
    
    return sharedInstance;
}
- (void)setcountdowntimeWithbutton:(NSInteger)time
                    timebuttonstus:(lxpbuttonblock)buttonstsus{

    _timeCount = time;
    _oldTimeCount = time;
    _statusType = Button_none;
    
    objc_setAssociatedObject(self, lxpstsusblock, buttonstsus, OBJC_ASSOCIATION_COPY);
    buttonstsus(Button_none);
    
    
}
/**
 *  个人博客地址：http://blog.csdn.net/mr_liu_easy_ios
 *
 *  欢迎查看
 */

- (void)setcountdowntimeWithbutton:(NSInteger)time
                      runningColor:(UIColor*)runingColor
                  runningTextcolor:(UIColor*)runingTextColor
                     runingImgName:(NSString*)runingImgName
                         formatStr:(NSString*)formatStr
                    lxpbuttonblock:(lxpbuttonblock)lxpbuttonblock{
    
    
    
    _runingImgName      =runingImgName;
    _runingColor        =runingColor;
    _runingTextColor    =runingTextColor;
    _formatStr          =formatStr;

    [self setcountdowntimeWithbutton:time timebuttonstus:^(Buttonstatus stats) {
        lxpbuttonblock(stats);
    }];
}

/**
 *  开始计时
 */
-(void)beginTimers{

    if (!self.timer) {
        NSTimer *timer  = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(next) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    
    //更新时间
    _timeCount = _oldTimeCount;
    //记录按钮的原始状态
    _normalBgColor       = self.backgroundColor;
    _normalBgImg         = self.currentBackgroundImage;
    _normalTextColor     = self.currentTitleColor;
    _normalText          = self.currentTitle;
    /*设置按钮样式*/
    //设置按钮计时时的样式
    if (_runingColor) {
        [self setBackgroundColor:_runingColor];
    }
    if (_runingImgName.length>0) {
        [self setBackgroundImage:[UIImage imageNamed:_runingImgName] forState:UIControlStateNormal];
    }
    if (_runingTextColor) {
        [self setTitleColor:_runingTextColor forState:UIControlStateNormal];
    }
    
    /*让按钮不可以点击*/
    self.userInteractionEnabled = NO;
    self.titleLabel.adjustsFontSizeToFitWidth=YES;
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self next];
    lxpbuttonblock blcok = objc_getAssociatedObject(self, lxpstsusblock);
    blcok(Button_running);
}
/**
 *  结束计时
 */
-(void)stopTimers{
    [self.timer invalidate];
    self.timer = nil;
    lxpbuttonblock blcok = objc_getAssociatedObject(self, lxpstsusblock);
    if (_timeCount ==0) {//超时了
        blcok(Button_Did);
    }else{
        //结束了但没有超时
        blcok(Button_cancle);
    }
    [self setBackgroundImage:_normalBgImg forState:UIControlStateNormal];
    [self setBackgroundColor:_normalBgColor];
    [self setTitleColor:_normalTextColor forState:UIControlStateNormal];
    [self setTitle:_normalText forState:UIControlStateNormal];
    self.userInteractionEnabled = YES;

}
- (void)next
{
    if (_timeCount<1) {
        //结束了 超时了
        [self stopTimers];
    }else{
        //改文字
        if (_formatStr.length>0) {
            [self setTitle:[NSString stringWithFormat:_formatStr,_timeCount] forState:UIControlStateNormal];
        }else{
            [self setTitle:[NSString stringWithFormat:@"%zdS",_timeCount] forState:UIControlStateNormal];
        }
        _timeCount--;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
