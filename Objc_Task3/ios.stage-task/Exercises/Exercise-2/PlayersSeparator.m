#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    
    NSMutableArray * teams = [[NSMutableArray alloc] initWithArray:@[]];
    
    for (int i = 0; i < [ratingArray count]; i++) {
        for (int j = i+1; j < [ratingArray count]; j++) {
            for (int k = j+1; k < [ratingArray count]; k++) {
                // rule 1
                NSLog(@"i = %i\n", [ratingArray[i] intValue]);
                NSLog(@"j = %i\n", [ratingArray[j] intValue]);
                NSLog(@"k = %i\n", [ratingArray[k] intValue]);

                if (([ratingArray[i] intValue] < [ratingArray[j] intValue]) && ([ratingArray[j] intValue] < [ratingArray[k] intValue])) {
                    
                    NSArray * newTeam = [[NSArray alloc] initWithArray:@[ratingArray[i],ratingArray[j],ratingArray[k]] copyItems:NO];
                    
                    if (![teams containsObject:newTeam]) {
                        [teams addObject:newTeam];
                    }
                }
                if (([ratingArray[i] intValue] > [ratingArray[j] intValue]) && ([ratingArray[j] intValue] > [ratingArray[k] intValue])) {
                    
                    NSArray * newTeam = [[NSArray alloc] initWithArray:@[ratingArray[i],ratingArray[j],ratingArray[k]] copyItems:NO];
                    
                    if (![teams containsObject:newTeam]) {
                        [teams addObject:newTeam];
                    }
                }
            }
        }
    }
    
    return [teams count];
}

@end
