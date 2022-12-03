//
//  CircleButton.m
//  IRCircleMenu-objc
//
//  Created by irons on 2022/11/16.
//

#import "CircleButton.h"

@implementation CircleButton

+ (id)buttonWithFrame:(CGRect)buttonFrame Image:(UIImage *)image Tag:(NSInteger)tag {
    CircleButton *btn = [CircleButton buttonWithType:UIButtonTypeCustom];

    btn.frame = buttonFrame;
    btn.backgroundColor = [UIColor clearColor];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setContentMode:UIViewContentModeScaleAspectFit];
    btn.tag = tag;
    btn.alpha = 0;

    return btn;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}


@end
