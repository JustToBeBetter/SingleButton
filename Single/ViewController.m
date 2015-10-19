//
//  ViewController.m
//  Single
//
//  Created by 李金柱 on 15/10/19.
//  Copyright (c) 2015年 李金柱. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,retain) NSMutableDictionary *dic;

@end

@implementation ViewController

@synthesize dic=_dic;



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(10, 20, 300, 400)];
    container.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:container];
    
    UILabel *questionText = [[UILabel alloc] initWithFrame:CGRectMake(0,0,280,20)];
    questionText.backgroundColor = [UIColor clearColor];
    questionText.text = @"1. Which color do you like?";
    [container addSubview:questionText];
    
    MyButton *rb1 = [[MyButton alloc] initWithGroupId:@"first group" index:0];
    MyButton *rb2 = [[MyButton alloc] initWithGroupId:@"first group" index:1];
    MyButton *rb3 = [[MyButton alloc] initWithGroupId:@"first group" index:2];
    
    rb1.frame = CGRectMake(10,30,22,22);
    rb2.frame = CGRectMake(10,60,22,22);
    rb3.frame = CGRectMake(10,90,22,22);
    
    [container addSubview:rb1];
    [container addSubview:rb2];
    [container addSubview:rb3];
 
    UILabel *label1 =[[UILabel alloc] initWithFrame:CGRectMake(40, 30, 60, 20)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"Red";
    [container addSubview:label1];
    
    UILabel *label2 =[[UILabel alloc] initWithFrame:CGRectMake(40, 60, 60, 20)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = @"Green";
    [container addSubview:label2];
    
    UILabel *label3 =[[UILabel alloc] initWithFrame:CGRectMake(40, 90, 60, 20)];
    label3.backgroundColor = [UIColor clearColor];
    label3.text = @"Blue";
    [container addSubview:label3];
    
    // idebug 增加
    
    UILabel *questionText2 = [[UILabel alloc] initWithFrame:CGRectMake(0,130,300,20)];
    questionText2.backgroundColor = [UIColor clearColor];
    [questionText2 setAdjustsFontSizeToFitWidth:YES];
    questionText2.text = @"2. Diaoyu islands belong to which country?";
    [container addSubview:questionText2];
    
    MyButton *rb11 = [[MyButton alloc] initWithGroupId:@"second group" index:0];
    MyButton *rb12 = [[MyButton alloc] initWithGroupId:@"second group" index:1];
    MyButton *rb13 = [[MyButton alloc] initWithGroupId:@"second group" index:2];
    
    rb11.frame = CGRectMake(10,160,22,22);
    rb12.frame = CGRectMake(10,190,22,22);
    rb13.frame = CGRectMake(10,220,22,22);
    
    // 设置一个默认选项
    [rb11 setChecked:YES];
    
    
    [container addSubview:rb11];
    [container addSubview:rb12];
    [container addSubview:rb13];
    
  
    
    UILabel *label11 =[[UILabel alloc] initWithFrame:CGRectMake(40, 160, 60, 20)];
    label11.backgroundColor = [UIColor clearColor];
    label11.text = @"China";
    [container addSubview:label11];
    
    UILabel *label22 =[[UILabel alloc] initWithFrame:CGRectMake(40, 190, 60, 20)];
    label22.backgroundColor = [UIColor clearColor];
    label22.text = @"China";
    [container addSubview:label22];
    
    UILabel *label33 =[[UILabel alloc] initWithFrame:CGRectMake(40, 220, 60, 20)];
    label33.backgroundColor = [UIColor clearColor];
    label33.text = @"China";
    [container addSubview:label33];
    
    
    [MyButton addObserverForGroupId:@"first group" observer:self];
    [MyButton addObserverForGroupId:@"second group" observer:self];
    
    
    
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    submitBtn.frame = CGRectMake(40, 280, 300-60, 40);
    [submitBtn setTitle:@"提交答案" forState:UIControlStateNormal];
    [submitBtn addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
    _dic = [[NSMutableDictionary alloc] initWithCapacity:16];
    
    
    
}

-(void)submitClick:(id)sender
{
    NSLog(@"dic=%@",self.dic);
    
    UILabel *resultLbl =[[UILabel alloc] initWithFrame:CGRectMake(40, 340, 240, 30)];
    resultLbl.backgroundColor = [UIColor whiteColor];
    resultLbl.textColor = [UIColor redColor];
    NSMutableString *resultStr = [[NSMutableString alloc] initWithCapacity:16];
    
    for (NSString *str in [self.dic allValues]) {
        [resultStr appendFormat:@" %@,",str];
    }
    resultLbl.text = resultStr;
    [self.view addSubview:resultLbl];
 
}

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    NSLog(@"changed to %lu in %@",(unsigned long)index,groupId);
    
    [_dic setObject:[NSString stringWithFormat:@"%lu",index+1] forKey:groupId];
}





@end
