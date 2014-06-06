//
//  Jesse Squires
//  http://www.hexedbits.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) Jesse Squires
//

#ifndef objc_sorts_sort_utils_h
#define objc_sorts_sort_utils_h

#define MAX_COUNT 10000

NSMutableArray* randomNumbersArray()
{
    NSLog(@"Generating array of %d random integers [0, %u)...", MAX_COUNT, UINT32_MAX);
    NSMutableArray *list = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < MAX_COUNT; i++) {
        int num = arc4random_uniform(UINT32_MAX);
        [list addObject:[NSNumber numberWithInteger:num]];
    }
    return list;
}

BOOL verfiySorted(NSMutableArray *arr)
{
    for (NSUInteger i = 0; i < arr.count-1; i++) {
        NSInteger a = [[arr objectAtIndex:i] integerValue];
        NSInteger b = [[arr objectAtIndex:i + 1] integerValue];
        
        if (a > b) {
            NSLog(@"Array not sorted!");
            return NO;
        }
    }
    return YES;
}

#endif
