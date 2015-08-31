//
//  CalendarViewController.m
//  BKTabBarView
//
//  Created by 锄禾日当午 on 15/7/21.
//  Copyright (c) 2015年 B&K. All rights reserved.
//

#import "CalendarViewController.h"
#import "NSDate+FSExtension.h"

@interface CalendarViewController()

@property (nonatomic, weak) UIWindow *sheetWindow ;//window必须为全局变量或成员变量

@end
@implementation CalendarViewController

- (void)dealloc
{
    NSLog(@"%@:%s", self.class.description, __FUNCTION__);
}
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    FSCalendar *calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.05, 108,self.view.bounds.size.width * 0.9, 300)];
 
    calendar.dataSource = self;
    calendar.delegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:calendar];
    

    
    calendar.firstWeekday = 2;
    self.calendar = calendar;
   
    
    FSCalendarHeader *header = [[FSCalendarHeader alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44)];//CGRectMake(0,64,_calendar.frame.size.width,44)];
    [self.view addSubview:header];
    calendar.header = header;
    calendar.selectedDate = [NSDate fs_dateWithYear:2015 month:8 day:1];
    //appearence
//    calendar.weekdayTextColor = [UIColor orangeColor];
//    calendar.headerTitleColor = [UIColor orangeColor];
//    calendar.eventColor = [UIColor greenColor];
//    calendar.selectionColor = [UIColor blueColor];
//    calendar.todayColor = [UIColor orangeColor];
//    calendar.headerDateFormat =@"MM月";
    calendar.header.minDissolveAlpha = 0;
    
}

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
    BKLog(@"did select date %@",[date fs_stringWithFormat:@"yyyy/MM/dd"]);

}

- (void)calendarCurrentMonthDidChange:(FSCalendar *)calendar
{
    BKLog(@"did change to month %@",[calendar.currentMonth fs_stringWithFormat:@"MMMM yyyy"]);
}

- (NSDate *)minimumDateForCalendar:(FSCalendar *)calendar
{
    return [NSDate fs_dateWithYear:2015 month:1 day:1];
}

//- (NSDate *)maximumDateForCalendar:(FSCalendar *)calendar
//{
//    return [NSDate fs_dateWithYear:2015 month:10 day:31];
//}

// FSCalendarDataSource




- (BOOL)calendar:(FSCalendar *)calendar hasEventForDate:(NSDate *)date
{
 
    return YES;
}

// FSCalendarDelegate
//日期是否能选择
- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
        return NO;
}

@end
