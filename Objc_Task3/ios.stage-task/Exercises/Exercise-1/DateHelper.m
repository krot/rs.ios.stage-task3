#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSString * result = nil;
    
    if (monthNumber > 0 && monthNumber < 13) {
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.day = 2;
        dateComponents.month = monthNumber;
        dateComponents.year = 2021;
        
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *date = [gregorianCalendar dateFromComponents:dateComponents];
        
        NSDateFormatter * outputDateFormatter = [[NSDateFormatter alloc] init];
        
        [outputDateFormatter setDateFormat:@"MMMM"];
        
        result = [outputDateFormatter stringFromDate:date];
        
        NSLog(@"%@", result);
    }
    
    return result;
    
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];

    
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZZZZZ";
    NSDate * dateObject = [dateFormatter dateFromString:date];
    
    NSDateFormatter * outputDateFormatter = [[NSDateFormatter alloc] init];
    [outputDateFormatter setDateFormat:@"d"];
    
    NSString * result = [outputDateFormatter stringFromDate:dateObject];
    
//    NSLog(@"%i", [result intValue]);
    
    return [result intValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSString * result = nil;
    
    NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
   
    NSDateFormatter * outputDateFormatter = [[NSDateFormatter alloc] init];
    
    outputDateFormatter.locale = locale;
    
    [outputDateFormatter setDateFormat:@"EE"];
    
    result = [outputDateFormatter stringFromDate:date];
    
    return result;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate * today = [NSDate now];
   
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents * todayWeekNumber = [calendar components:NSCalendarUnitWeekOfYear fromDate:today];
    
    NSDateComponents * weekNumber = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    
    return [todayWeekNumber weekOfYear] == [weekNumber weekOfYear];

}

@end
