//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

#import "sorts.h"

void objcSort(NSMutableArray *arr)
{
    [arr sortUsingComparator:^NSComparisonResult(NSNumber *n1, NSNumber *n2) {
        return [n1 compare:n2];
    }];
}

void selectionSort(NSMutableArray *arr)
{
    NSUInteger minIndex = 0;
    
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        minIndex = i;
        
        for (NSUInteger j = i + 1; j < arr.count; j++) {
            if ([[arr objectAtIndex:j] integerValue] < [[arr objectAtIndex:minIndex] integerValue]) {
                minIndex = j;
            }
        }
        
        if (minIndex != i) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:minIndex];
        }
    }
}

void insertionSort(NSMutableArray *arr)
{
    for (NSUInteger i = 1; i < arr.count; i++) {
        NSUInteger j = i;
        NSNumber *target = [arr objectAtIndex:i];
        
        while (j > 0 && target.integerValue < [[arr objectAtIndex:j - 1] integerValue]) {
            [arr exchangeObjectAtIndex:j withObjectAtIndex:j - 1];
            j--;
        }
        [arr replaceObjectAtIndex:j withObject:target];
    }
}

NSUInteger partition(NSMutableArray *arr, NSUInteger left, NSUInteger right)
{
    NSUInteger i = left;
    NSUInteger j = right;
    NSInteger pivot = [[arr objectAtIndex:(left + right) / 2] integerValue];
    
    while (i <= j) {
        while ([[arr objectAtIndex:i] integerValue] < pivot) {
            i++;
        }
        
        while (j > 0 && [[arr objectAtIndex:j] integerValue] > pivot) {
            j--;
        }
        
        if (i <= j) {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
            i++;
            
            if (j > 0) {
                j--;
            }
        }
    }
    return i;
}

void merge(NSMutableArray *arr, NSUInteger first, NSUInteger mid, NSUInteger last)
{
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    NSUInteger indexA = first;
    NSUInteger indexB = mid;
    
    while (indexA < mid && indexB < last) {
        NSNumber *numA = [arr objectAtIndex:indexA];
        NSNumber *numB = [arr objectAtIndex:indexB];
        
        if (numA.integerValue < numB.integerValue) {
            [tempArr addObject:numA];
            indexA++;
        }
        else {
            [tempArr addObject:numB];
            indexB++;
        }
    }
    
    while (indexA < mid) {
        [tempArr addObject:[arr objectAtIndex:indexA]];
        indexA++;
    }
    
    while (indexB < last) {
        [tempArr addObject:[arr objectAtIndex:indexB]];
        indexB++;
    }
    
    indexA = first;
    
    for (NSUInteger i = 0; i < tempArr.count; i++) {
        [arr replaceObjectAtIndex:indexA withObject:[tempArr objectAtIndex:i]];
        indexA++;
    }
}

void merge_sort(NSMutableArray *arr, NSUInteger first, NSUInteger last)
{
    if (first + 1 < last) {
        NSUInteger mid = (first + last) / 2;
        merge_sort(arr, first, mid);
        merge_sort(arr, mid, last);
        merge(arr, first, mid, last);
    }
}

void mergeSort(NSMutableArray *arr)
{
    merge_sort(arr, 0, arr.count);
}

void quick_sort(NSMutableArray *arr, NSUInteger left, NSUInteger right)
{
    NSUInteger index = partition(arr, left, right);
    
    if (left < index - 1) {
        quick_sort(arr, left, index - 1);
    }
    
    if (index < right) {
        quick_sort(arr, index, right);
    }
}

void quickSort(NSMutableArray *arr)
{
    quick_sort(arr, 0, arr.count - 1);
}

void sift_down(NSMutableArray *arr, NSUInteger start, NSUInteger end)
{
    NSUInteger root = start;
    
    while ((root * 2 + 1) <= end) {
        NSUInteger child = root * 2 + 1;
        
        if (child + 1 <= end && [[arr objectAtIndex:child] integerValue] < [[arr objectAtIndex:child + 1] integerValue]) {
            child++;
        }
        
        if ([[arr objectAtIndex:root] integerValue] < [[arr objectAtIndex:child] integerValue]) {
            [arr exchangeObjectAtIndex:root withObjectAtIndex:child];
            root = child;
        }
        else {
            return;
        }
    }
}

void heapify(NSMutableArray *arr, NSUInteger count)
{
    NSInteger start = (count - 2) / 2;
    
    while (start >= 0) {
        sift_down(arr, start, count - 1);
        start--;
    }
}

void heapSort(NSMutableArray *arr)
{
    heapify(arr, arr.count);
    
    NSInteger end = arr.count - 1;
    
    while (end > 0) {
        [arr exchangeObjectAtIndex:end withObjectAtIndex:0];
        sift_down(arr, 0, end - 1);
        end--;
    }
}

void bubbleSort(NSMutableArray *arr)
{
    BOOL swapped = YES;
    NSUInteger k = 0;
    
    while (swapped) {
        swapped = NO;
        
        for (NSInteger i = 0; i < arr.count - 1 - k; i++) {
            if ([[arr objectAtIndex:i] integerValue] > [[arr objectAtIndex:i + 1] integerValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
        k++;
    }
}
