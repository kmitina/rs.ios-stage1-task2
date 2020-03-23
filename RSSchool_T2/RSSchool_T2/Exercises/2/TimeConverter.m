#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    int hoursInt = [hours intValue];
        int minutesInt = [minutes intValue];
        if (hoursInt>12 || hoursInt<0 || minutesInt>=60 || minutesInt<0 ){
            return @"";
        }
        NSDictionary *hourD =@{@"1" : @"one", @"2" : @"two", @"3" : @"three", @"4" : @"four", @"5" : @"five", @"6" : @"six", @"7" : @"seven", @"8" : @"eight", @"9" : @"nine",@"10" : @"ten", @"11" : @"eleven", @"12" : @"twelve"};
        NSDictionary * time = @{@"1" : @"one minute", @"2" : @"two minutes", @"3" : @"three minutes", @"4" : @"four minutes", @"5" : @"five minutes", @"6" : @"six minutes", @"7" : @"seven minutes", @"8" : @"eight minutes", @"9" : @"nine minutes",@"10" : @"ten minutes", @"11" : @"eleven minutes", @"12" : @"twelve minutes", @"13" : @"thirteen minutes", @"14" : @"fourteen minutes", @"15" : @"fifteen minutes", @"16" : @"sixteen minutes",@"17" : @"seventeen minutes", @"18" : @"eighteen minutes", @"19" : @"nineteen minutes", @"20" : @"twenty minutes", @"21" : @"twenty one minutes", @"22" : @"twenty two minutes", @"23" : @"twenty three minutes",@"24" : @"twenty four minutes", @"25" : @"twenty five minutes", @"26" : @"twenty six minutes", @"27" : @"twenty seven minutes", @"28" : @"twenty eight minutes", @"29" : @"twenty nine minutes"};

        if (minutesInt == 0){
            return [NSString stringWithFormat:@"%@ o' clock",[hourD valueForKey:hours]];
        } else
            if (minutesInt<=30) {
                if (minutesInt == 30){
                    return [NSString stringWithFormat:@"half past %@",[hourD valueForKey:hours]];
                } else
                    if (minutesInt == 15){
                        return [NSString stringWithFormat:@"quarter past %@",[hourD valueForKey:hours]];
                    }
                    else{
                        return [NSString stringWithFormat:@"%@ past %@",[time valueForKey:[NSString stringWithFormat:@"%d",minutesInt]],[hourD valueForKey:hours]];

                    }
            } else
                if (minutesInt == 45){
                    return [NSString stringWithFormat:@"quarter to %@",[hourD valueForKey:[NSString stringWithFormat:@"%d",hoursInt+1]]];
                } else
                    return [NSString stringWithFormat:@"%@ to %@",[time valueForKey:[NSString stringWithFormat:@"%d",60-minutesInt]],[hourD valueForKey:[NSString stringWithFormat:@"%d",hoursInt+1]]];

}
@end
