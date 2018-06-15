//
//  ViewController.m
//  JLCalendarViewOCDemo
//
//  Created by Joe on 2018/6/15.
//  Copyright © 2018年 JoeLai. All rights reserved.
//

#import "ViewController.h"
#import <JLCalendarView/JLCalendarView-swift.h>

@interface ViewController ()<JLCalViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    JLCalMonthView *monthView = [[JLCalMonthView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0)];
    JLCalManager *manager = [[JLCalManager alloc] init];
    manager.settings.titleHeight = 44.0;
    manager.settings.weekDayHeight = 30.0;
    manager.settings.weekHeight = 50.0;

    manager.delegate = self;
    monthView.calManager = manager;
    monthView.date = [NSDate date];
    
    [self.view addSubview:monthView];
}

- (void)prepareDayView:(UIView *)view manager:(JLCalManager *)manager
{
    if([view isKindOfClass:[JLCalDayView class]])
    {
        JLCalDayView *dayView = (JLCalDayView *)view;
        dayView.circleView.hidden = ![manager.dateHelper isSameDay:dayView.date asDate:[NSDate date]];
        dayView.textLabel.textColor = [manager.dateHelper isSameDay:dayView.date asDate:[NSDate date]]?[UIColor whiteColor]:[UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
