//
//  merge_sort.h
//  objc-sorts
//
//  Created by Jesse Squires on 6/6/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#ifndef objc_sorts_mergesort_h
#define objc_sorts_mergesort_h

NSMutableArray* merge(NSMutableArray *left, NSMutableArray *right)
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    while(left.count > 0 || right.count > 0) {
        
        if(left.count > 0 && right.count > 0) {
            
            NSInteger leftFirst = [[left objectAtIndex:0] integerValue];
            NSInteger rightFirst = [[right objectAtIndex:0] integerValue];
            
            if(leftFirst <= rightFirst) {
                [result addObject:[left objectAtIndex:0]];
                [left removeObjectAtIndex:0];
            }
            else {
                [result addObject:[right objectAtIndex:0]];
                [right removeObjectAtIndex:0];
            }
        }
        else if(left.count > 0) {
            [result addObject:[left objectAtIndex:0]];
            [left removeObjectAtIndex:0];
        }
        else if(right.count > 0) {
            [result addObject:[right objectAtIndex:0]];
            [right removeObjectAtIndex:0];
        }
    }
    return result;
}

NSMutableArray* merge_sort(NSMutableArray *arr)
{
    if(arr.count <= 1)
        return arr;
    
    NSMutableArray *left = [[NSMutableArray alloc] init];
    NSMutableArray *right = [[NSMutableArray alloc] init];
    NSUInteger middle = (arr.count / 2);
    
    for(NSUInteger i = 0; i < middle; i++)
        [left addObject:[arr objectAtIndex:i]];
    
    for(NSUInteger i = middle; i < arr.count; i++)
        [right addObject:[arr objectAtIndex:i]];
    
    left = merge_sort(left);
    right = merge_sort(right);
    
    return merge(left, right);
}

#endif
