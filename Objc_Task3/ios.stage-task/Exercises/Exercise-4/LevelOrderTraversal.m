#import "LevelOrderTraversal.h"
#import "BinaryTree.h"
#import "BinaryNode.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    
    NSMutableArray * result = [[NSMutableArray alloc] initWithArray:@[]];
    
    if (![tree count]) {
        return result;
    }
    
    NSArray * preorder = [tree copy]; // @[@15, @10, @8, @12, @20, @16, @25];
    
    BinaryTree * bst = [[BinaryTree alloc] init];
    
    BinaryNode * root = [bst buildTreeFromPreorder:preorder start:0 end:(int)[preorder count]-1];
    
    if (root == nil || [root data] == nil) {
        return [result copy];
    }
    
    result = [bst levelOrderTraversal:root result:result level:0];
    
//    NSLog(@"%@", result);
    
    
    NSArray *newResult = @[];
    NSArray * newSubArray = @[];
    NSArray * subArray = @[];
    
    
    for (int i = 0; i < [result count]; i++) {
        
        newSubArray = @[];
        subArray = result[i];
        
        for (int j=0; j < [subArray count]; j++) {
            if ([subArray[j] isKindOfClass:[NSNumber class]]) {
                newSubArray = [newSubArray arrayByAddingObject:subArray[j]];
            }
        }
        if ([newSubArray count]>0) {
            newResult = [newResult arrayByAddingObject:newSubArray];
        }
    }
    
//    NSLog(@"res: %@", newResult);
    
    return [newResult copy];
    
    
    //    return [result copy];
    
    //
    //    id prevItem = root;
    //
    //
    //    for (int i = 1; i < [tree count]; i++) {
    //
    //
    //        if ([tree[i] isKindOfClass:[NSNumber class]]) {
    //
    //            if (![prevItem isKindOfClass:[NSNull class]]) {
    //                level++;
    //            }
    //
    //            // add subarray at level index to result if not exists
    //            if ([result count] - 1 < level) {
    //                [result addObject:@[]];
    //            }
    //            else {
    //                if ([result[level] count] == 2) {
    //                    do {
    //                        level--;
    //                    } while ([result[level] count] == 2);
    //                }
    //            }
    //
    //            NSArray * subArray = result[level];
    //
    //            [result replaceObjectAtIndex:level withObject:[subArray arrayByAddingObject:tree[i]]];
    //
    ////            if ([levelCounts count] - 1 < level) {
    ////                [levelCounts addObject:@0];
    ////            }
    ////
    ////            NSNumber * num = [[NSNumber alloc] initWithInt:[levelCounts[level] intValue] + 1];
    ////
    ////            [levelCounts replaceObjectAtIndex:level withObject:num];
    //
    //            prevItem = tree[i];
    //        }
    //        else {
    //
    //            if ([prevItem isKindOfClass:[NSNull class]]) {
    //
    ////                if ([levelCounts count] - 1 < level) {
    ////                    [levelCounts addObject:@0];
    ////                }
    ////
    ////                NSNumber * num = [[NSNumber alloc] initWithInt:[levelCounts[level] intValue] + 1];
    ////
    ////                [levelCounts replaceObjectAtIndex:level withObject:num];
    //
    //                if ([result count] - 1 < level) {
    //                    [result addObject:@[]];
    //                }
    //
    //                NSArray * subArray = result[level];
    //
    //                [result replaceObjectAtIndex:level withObject:[subArray arrayByAddingObject:tree[i]]];
    //
    //                level--;
    //            }
    //            else {
    //                level++;
    //
    //                if ([result count] - 1 < level) {
    //                    [result addObject:@[]];
    //                }
    //
    //                NSArray * subArray = result[level];
    //
    //                [result replaceObjectAtIndex:level withObject:[subArray arrayByAddingObject:tree[i]]];
    //
    ////                if ([levelCounts count] - 1 < level) {
    ////                    [levelCounts addObject:@0];
    ////                }
    ////
    ////                NSNumber * num = [[NSNumber alloc] initWithInt:[levelCounts[level] intValue] + 1];
    ////
    ////                [levelCounts replaceObjectAtIndex:level withObject:num];
    //            }
    //
    //
    //
    //
    //            prevItem = tree[i];
    //
    //        }
    //    }
    //
    //
    //    NSArray *newResult = @[];
    //    NSArray * newSubArray = @[];
    //    NSArray * subArray = @[];
    //
    //
    //    for (int i = 0; i < [result count]; i++) {
    //
    //        newSubArray = @[];
    //        subArray = result[i];
    //
    //        for (int j=0; j < [subArray count]; j++) {
    //            if ([subArray[j] isKindOfClass:[NSNumber class]]) {
    //                newSubArray = [newSubArray arrayByAddingObject:subArray[j]];
    //            }
    //        }
    //        if ([newSubArray count]>0) {
    //            newResult = [newResult arrayByAddingObject:newSubArray];
    //        }
    //    }
    //
    //    return newResult;
    
    
}
