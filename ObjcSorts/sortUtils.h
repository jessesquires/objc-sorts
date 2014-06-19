//
//  Jesse Squires
//  http://www.jessesquires.com
//
//  GitHub
//  https://github.com/jessesquires/objc-sorts
//
//  Copyright (c) 2014 Jesse Squires
//

#import <Foundation/Foundation.h>

typedef void (^SortAlgorithmBlock)(NSMutableArray *arr);

typedef NS_ENUM(NSUInteger, SortAlgorithmType) {
    SortAlgorithmTypeObjC,
    SortAlgorithmTypeQuick,
    SortAlgorithmTypeHeap,
    SortAlgorithmTypeInsertion,
    SortAlgorithmTypeSelection,
    SortAlgorithmTypeMerge,
    SortAlgorithmTypeBubble
};

NSMutableArray* randomIntegerArray(NSUInteger count);

BOOL arrayIsSorted(NSMutableArray *arr);

NSString* sortAlgorithmNameForType(SortAlgorithmType type);

NSTimeInterval sortArrayWithNameUsingBlock(NSMutableArray *anArray,
                                           SortAlgorithmType sortType,
                                           SortAlgorithmBlock sortBlock);
