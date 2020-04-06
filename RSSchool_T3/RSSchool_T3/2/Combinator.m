#import "Combinator.h"

@interface Math : NSObject
+ (long int)factorial:(long int)n;
@end;

@implementation Math
+ (long int)factorial:(long int)n {
    if (n == 0)
        return 1;
    return n * [Math factorial:n-1];
}
@end

@implementation Combinator
- (NSNumber*)chechChooseFromArray:(NSArray <NSNumber*>*)array {
    int m = [[array objectAtIndex:0] intValue];
    int n = [[array objectAtIndex:1] intValue];
    long int x = 1;
    long int nFact = [Math factorial:n];
    
    while (m != nFact / ([Math factorial:x] * [Math factorial:n-x])) {
        x++;
        if (n-x < 0) {
            return nil;
        }
    }
    return [NSNumber numberWithLong:x];
}

@end
