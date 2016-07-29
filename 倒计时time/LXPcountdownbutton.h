//
//  LXPcountdownbutton.h
//  倒计时time
//
//  Created by chuangqu on 16/7/29.
//  Copyright © 2016年 mr.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM (NSInteger , Buttonstatus){
    Button_none,
    Button_running,
    Button_cancle,
    Button_Did
};

typedef void (^lxpbuttonblock)(Buttonstatus stats);
typedef void (^MyTextBlock) (NSString *myText);

@interface LXPcountdownbutton : UIButton

/**
 *  正在计时按钮的背景颜色
 */
@property(nonatomic,strong)UIColor *runingColor;
/**
 *  正在计时按钮的文字的颜色
 */
@property(nonatomic,strong)UIColor *runingTextColor;
/**
 *  正在计时时的图片
 */
@property(nonatomic,copy) NSString  *runingImgName;
/**
 *  格式化文字 例如（剩余时间%zd秒）
 */
@property(nonatomic,copy) NSString  *formatStr;


/**
 *  控件的状态
 */
@property(nonatomic,assign)Buttonstatus statusType;
/**
 *  计时的时间
 */
@property(nonatomic,assign)NSInteger timeCount;
/**
 *  计时原始时间
 */
@property(nonatomic,assign)NSInteger oldTimeCount;
/**
 *  计时器
 */
@property(weak, nonatomic) NSTimer *timer;
/**
 *  按钮的初始背景色
 */
@property(nonatomic,strong)UIColor *normalBgColor;
/**
 *  按钮的初始背景图片
 */
@property(nonatomic,strong)UIImage *normalBgImg;
/**
 *  按钮默认情况下的文字颜色
 */
@property(nonatomic,strong)UIColor *normalTextColor;
@property(nonatomic,copy)NSString  *normalText;


+(LXPcountdownbutton*)shareInstance;

/**
 *  设置button的时间和button的状态
 *
 *  @param time        时间
 *  @param buttonstsus 状态的回调
 */
- (void)setcountdowntimeWithbutton:(NSInteger)time
                    timebuttonstus:(lxpbuttonblock)buttonstsus;
/**
 *  设置button运行的时候的状态
 *
 *  @param time            <#time description#>
 *  @param runingColor     <#runingColor description#>
 *  @param runingTextColor <#runingTextColor description#>
 *  @param runingImgName   <#runingImgName description#>
 *  @param formatStr       <#formatStr description#>
 *  @param lxpbuttonblock  <#lxpbuttonblock description#>
 */
- (void)setcountdowntimeWithbutton:(NSInteger)time
                      runningColor:(UIColor*)runingColor
                runningTextcolor:(UIColor*)runingTextColor
                     runingImgName:(NSString*)runingImgName
                         formatStr:(NSString*)formatStr
                    lxpbuttonblock:(lxpbuttonblock)lxpbuttonblock;
/**
 *  开始计时
 */
-(void)beginTimers;
/**
 *  结束计时
 */
-(void)stopTimers;


@end
