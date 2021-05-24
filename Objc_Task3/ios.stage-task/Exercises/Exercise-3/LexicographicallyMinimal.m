#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSString * result = @"";

    unichar char1 = 0;
    unichar char2 = 0;
    
    while (([string1 length] + [string2 length])>0) {
        
        char1 = ([string1 length]>0) ? [string1 characterAtIndex:0] : 0;
        char2 = ([string2 length]>0) ? [string2 characterAtIndex:0] : 0;
        
        if (char1 !=0 && char2 !=0) {
            if (char1 <= char2) {
                result = [result stringByAppendingString:[NSString stringWithCharacters:&char1 length:1]];
                string1 = [string1 substringFromIndex:1];
            }
            else {
                result = [result stringByAppendingString:[NSString stringWithCharacters:&char2 length:1]];
                string2 = [string2 substringFromIndex:1];
            }
        }
        else {
            if (char1 !=0 ) {
                result = [result stringByAppendingString:[NSString stringWithCharacters:&char1 length:1]];
                string1 = [string1 substringFromIndex:1];
            }
            if (char2 !=0) {
                result = [result stringByAppendingString:[NSString stringWithCharacters:&char2 length:1]];
                string2 = [string2 substringFromIndex:1];
            }
        }
    }
    
    return result;
}

@end
