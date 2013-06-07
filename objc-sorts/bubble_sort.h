//
//  bubble_sort.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/6/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#ifndef objc_sorts_bubble_sort_h
#define objc_sorts_bubble_sort_h

void bubble_sort(NSMutableArray *arr)
{
    BOOL swapped = YES;
    
    while(swapped) {
        swapped = NO;
        
        for(int i = 0; i < arr.count - 1; i++) {
            NSNumber *numA = [arr objectAtIndex:i];
            NSNumber *numB = [arr objectAtIndex:i + 1];
            
            if(numA.integerValue > numB.integerValue) {
                [arr replaceObjectAtIndex:i withObject:numB];
                [arr replaceObjectAtIndex:i + 1 withObject:numA];
                swapped = YES;
            }
        }
    }
}

#endif
