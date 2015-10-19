//
//  MyButton.h
//  Single
//
//  Created by 李金柱 on 15/10/19.
//  Copyright (c) 2015年 李金柱. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RadioButtonDelegate <NSObject>
-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;
@end

@interface MyButton : UIView{
    NSString *_groupId;
    NSUInteger _index;
    UIButton *_button;
}
@property(nonatomic,retain)NSString *groupId;
@property(nonatomic,assign)NSUInteger index;

-(id)initWithGroupId:(NSString*)groupId index:(NSUInteger)index;
+(void)addObserverForGroupId:(NSString*)groupId observer:(id)observer;

// 可以设置默认选中项
- (void) setChecked:(BOOL)isChecked;


@end
