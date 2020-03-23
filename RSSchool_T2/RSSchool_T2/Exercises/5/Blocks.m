#import "Blocks.h"

@interface Blocks ()
@property (nonatomic, copy) NSArray *arrayA;
@property (nonatomic, copy) Class class;

@end


@implementation Blocks


- (BlockA)blockA {
    return [^(NSArray *array) {
        self->_arrayA = [array copy];
    }
        copy];
}

- (BlockB)blockB {
    return [^(Class class) {
        self->_class = class;
        NSMutableArray *changeArray = [[self arrayA] mutableCopy];
        if (class == [NSNumber class]) {
            NSInteger sum = 0;
            for (NSObject *oneNumber in [self arrayA]) {
                if ([oneNumber isKindOfClass:class]) {
                    sum += [(NSNumber *)oneNumber intValue];
                }
            }
            self.blockC([[NSNumber alloc] initWithInteger:sum]);
        } else if (class == [NSString class]) {
            NSString *concatenation = @"";
            for (NSObject *oneWord in changeArray) {
                if ([oneWord isKindOfClass:class]) {
                    concatenation = [concatenation stringByAppendingString:(NSString *)oneWord];
                }
            }
            self.blockC(concatenation);

        } else {
            NSTimeInterval latestInterv = 0;
            for (NSObject *oneDate in [self arrayA]) {
                if ([oneDate isKindOfClass:class]) {
                    NSTimeInterval someTimeInterv = [(NSDate *)oneDate timeIntervalSince1970];
                    if (someTimeInterv > latestInterv) {
                        latestInterv = someTimeInterv;
                    }
                }
            }
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"dd.MM.yyyy"];
            self.blockC([dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970: latestInterv]]);
        }
    }copy];
}
@end

