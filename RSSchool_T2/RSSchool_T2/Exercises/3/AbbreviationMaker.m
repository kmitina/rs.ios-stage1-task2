#import "AbbreviationMaker.h"

@implementation AbbreviationMaker

- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSMutableCharacterSet *formatA = [NSMutableCharacterSet characterSetWithCharactersInString: [a lowercaseString]];
        NSMutableCharacterSet *formatB = [NSMutableCharacterSet characterSetWithCharactersInString: [b lowercaseString]];

        if ([formatA isSupersetOfSet:formatB]) {
            int k = 0;

            for (int i = 0; i < a.length; i++) {
                if ([[[a lowercaseString] substringWithRange:NSMakeRange(i, 1)] isEqualToString:[[b lowercaseString] substringWithRange:NSMakeRange(k, 1)]]) {
                    k++;
                    if (b.length == k) {
                        return @"YES";
                    }
                }
            }
            if (k < b.length) {
                return @"NO";
            }
            return @"YES";
        }
        return @"NO";
    
}
@end
