//
//  ViewController.m
//  IRCircleMenu-objc
//
//  Created by irons on 2022/11/16.
//

#import "ViewController.h"
#import "CircleButton.h"

#define Radius_Length 120.f
#define Over_Distance 23.f

@interface ViewController () {
    BOOL hadOpen;
    IBOutlet UIButton *centerButton;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImage *bgImage = [UIImage imageNamed:@"circle"];
    CGRect defaultFrame = centerButton.frame;

    for (int i = 0; i < 8; i++) {
        CircleButton *circleBtn = [CircleButton buttonWithFrame:defaultFrame Image:bgImage Tag:i];
        [self.view addSubview:circleBtn];
    }

    [self.view bringSubviewToFront:centerButton];
}

- (CGFloat)getOffsetWithDistance:(CGFloat)distance {
    return sqrtl((distance*distance) / 2.f);
}

- (CGPoint)getNewPointWithCenter:(CGPoint)center Tag:(NSInteger)tag OverDistance:(CGFloat)overDistance {
    CGFloat x = center.x;
    CGFloat y = center.y;
    CGFloat distance = Radius_Length + overDistance;
    CGFloat offset = [self getOffsetWithDistance:distance];

    switch (tag) {
        case 0: {
            y = y - distance;
        }
            break;
        case 1: {
            x = x + offset;
            y = y - offset;
        }
            break;
        case 2: {
            x = x + distance;
        }
            break;
        case 3: {
            x = x + offset;
            y = y + offset;
        }
            break;
        case 4: {
            y = y + distance;
        }
            break;
        case 5: {
            x = x - offset;
            y = y + offset;
        }
            break;
        case 6: {
            x = x - distance;
        }
            break;
        case 7: {
            x = x - offset;
            y = y - offset;
        }
            break;
        default:
            break;
    }

    return CGPointMake(x, y);
}

- (IBAction)centerButtonClick:(id)sender {
    if (!hadOpen) {
        hadOpen = YES;

        [UIView animateWithDuration:.3f animations:^{
            for (UIView* subView in self.view.subviews) {
                if ([subView isKindOfClass:[CircleButton class]]) {
                    CircleButton *btn = (CircleButton *)subView;
                    btn.center = [self getNewPointWithCenter:btn.center Tag:btn.tag OverDistance:Over_Distance];
                    btn.alpha = 1.f;
                }
            }
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:.1f animations:^{
                for (UIView *subView in self.view.subviews) {
                    if ([subView isKindOfClass:[CircleButton class]]) {
                        CircleButton *btn = (CircleButton *)subView;
                        btn.center = [self getNewPointWithCenter:self->centerButton.center Tag:btn.tag OverDistance:0];
                    }
                }
            } completion: nil];
        }];
    }
}

@end
