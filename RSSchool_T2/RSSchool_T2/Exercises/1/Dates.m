#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
   if (!day || !month || !year) return @"Такого дня не существует";
        NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
        dateComponents.day = [day integerValue];
        dateComponents.month = [month integerValue];
        dateComponents.year = [year integerValue];

        if ([dateComponents isValidDateInCalendar:calendar]) {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
            dateFormatter.dateFormat = @"dd MMMM, EEEE";
            NSDate *curDate = [calendar dateFromComponents:dateComponents];
            return [dateFormatter stringFromDate:curDate];
        }
        return @"Такого дня не существует";
     
}

@end
