#import "PolynomialConverter.h"

@implementation PolynomialConverter
- (NSString*)convertToStringFrom:(NSArray <NSNumber*>*)numbers {
    NSMutableString *resultString = [NSMutableString new];
    NSInteger maxPow = 0;
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:numbers];
    int deletedZeros = 0;
    
    if (numbers.count == 0) {
        return nil;
    }
    
    for (NSInteger i = 0; i < numbers.count; i++) {
        NSInteger intNum = [[numbers objectAtIndex:i] intValue];
        if (intNum == 0){
            deletedZeros++;
        }
    }
    
    if (deletedZeros) {
        maxPow = tempArray.count - deletedZeros;
    } else {
        maxPow = tempArray.count - 1;
    }
    
    for (int i = 0; i < tempArray.count; i++) {
        if ([[tempArray objectAtIndex:i] intValue] == 0) {
            continue;
        }
        if (i == tempArray.count - 2){
            if (tempArray.count == 2){
                NSString *xPowStr = [NSString stringWithFormat:@"%dx", [[tempArray objectAtIndex:i] intValue]];
                [resultString appendString:xPowStr];
                break;
            }
            if ([[tempArray objectAtIndex:i] intValue] == -1) {
                NSString *xPowStr = @"-x ";
                [resultString appendString:xPowStr];
                continue;
            }
            NSString *xPowStr = [NSString stringWithFormat:@"%dx ", [[tempArray objectAtIndex:i] intValue]];
            [resultString appendString:xPowStr];
            continue;
        }
        if (i == maxPow) {
            NSString *xPowStr = [NSString stringWithFormat:@"%d", [[tempArray objectAtIndex:i] intValue]];
            [resultString appendString:xPowStr];
            break;
        }
        if ([[tempArray objectAtIndex:i] intValue] == 1) {
            NSString *xPowStr = [NSString stringWithFormat:@"x^%lu ", maxPow - i];
            [resultString appendString:xPowStr];
        } else if ([[tempArray objectAtIndex:i] intValue] == -1) {
            NSString *xPowStr = [NSString stringWithFormat:@"-x^%lu ", maxPow - i];
            [resultString appendString:xPowStr];
        } else {
            NSString *xPowStr = [NSString stringWithFormat:@"%dx^%lu ", [[tempArray objectAtIndex:i] intValue], maxPow - i];
            [resultString appendString:xPowStr];
        }
    }
    
    NSString *replacedWhiteSpacesStr = [resultString stringByReplacingOccurrencesOfString:@" " withString:@" + "];
    NSString *replacedSignsStr = [replacedWhiteSpacesStr stringByReplacingOccurrencesOfString:@"+ -" withString:@"- "];
    resultString = [replacedSignsStr mutableCopy];
    
    return resultString;
}
@end
