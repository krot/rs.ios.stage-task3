//
//  BinaryTree.m
//  ios.stage-task
//
//  Created by Rust Enikeev on 5/24/21.
//

#import <Foundation/Foundation.h>
#import "BinaryTree.h"
#import "BinaryNode.h"

@implementation BinaryTree: NSObject

- (BinaryNode *)buildTreeFromPreorder:(NSArray *)preorder start:(int)start end:(int)end {
    
    const int ROOT = 1;
    const int LEFT = 2;
    const int RIGHT = 3;
//    const int PARENT = 4;
    
    const int VAL_TYPE_NULL = 1;
    const int VAL_TYPE_NUMERIC = 2;
    
    
    int state = ROOT;
    int valType;
    
    BinaryNode * root;
    BinaryNode * parentNode;
    BinaryNode * newNode;
    
    
    if (start > [preorder count]) {
        return nil;
    }
    
    id value;
    
    root = [self createNode:[preorder objectAtIndex:start]];
    parentNode = root;
    
    for (int i = 1; i < [preorder count]; i++) {
        
        value = [preorder objectAtIndex:i];
        valType = ([value isKindOfClass:[NSNumber class]]) ? VAL_TYPE_NUMERIC : VAL_TYPE_NULL;
        
        newNode = [self createNode:[preorder objectAtIndex:i]];
        
        BOOL solved = false;
        
        do {
            
            if (valType == VAL_TYPE_NUMERIC) {
                
                if ([parentNode left] == nil) {
                    state = LEFT;
                    solved = true;
                }
                else if ([parentNode left] != nil) {
                 //   state = RIGHT;
                    
                    if ([parentNode right] == nil){
                        state = RIGHT;
                        solved = true;
                        
                    }
                    else if ([parentNode right] != nil) {
                        parentNode = [parentNode parent];
                    }
                }
            }
            else {
                if ([parentNode left] == nil) {
                    state = LEFT;
                    solved = true;
                }
                else if ([parentNode left] != nil) {
                   // state = RIGHT;
                    
                    if ([parentNode right] == nil){
                        state = RIGHT;
                        solved = true;
                    }
                    else if ([parentNode right] != nil) {
                        parentNode = [parentNode parent];
                    }
                }
            }
        } while (!solved);
        
        
        if (state == LEFT) {
            [newNode setValue:parentNode forKey:@"parent"];
            parentNode.left = newNode;
            if (valType == VAL_TYPE_NUMERIC) {
                parentNode = newNode;
            }
        }
        if (state == RIGHT) {
            [newNode setValue:parentNode forKey:@"parent"];
            parentNode.right = newNode;
            if (valType == VAL_TYPE_NUMERIC) {
                parentNode = newNode;
            }
            else
            if (valType == VAL_TYPE_NULL) {
                parentNode = [parentNode parent];
            }
        }
    }
    
    return root;
}


// For creating normal BST Tree

//- (BinaryNode *)buildTreeFromPreorderOld:(NSArray *)preorder start:(int)start end:(int)end {
//    if (start > end) {
//        return nil;
//    }
//
//    if ([[preorder objectAtIndex:start] isKindOfClass:[NSNull class]]) {
//        return nil;
//    }
//
//    BinaryNode * node = [self createNode:[preorder objectAtIndex:start]];
//
//    int i = start;
//    while  (i <= end) {
//        if ([[preorder objectAtIndex:i] isKindOfClass:[NSNull class]]) {
//            i++;
//            continue;
//        }
//        if ([preorder[i] intValue] > [[node data] intValue]) {
//            i++;
//            break;
//        }
//        i++;
//    }
//
//    [node setValue:[self buildTreeFromPreorder:preorder start:start+1 end:i-1] forKey:@"left"];
//    [node setValue:[self buildTreeFromPreorder:preorder start:i+1 end:end] forKey:@"right"];
//
//    return node;
//}


- (NSMutableArray *)levelOrderTraversal:(BinaryNode *)root result:(NSMutableArray *)result level:(int)level {
    
    NSNumber *item = [root data];
    
    // add subarray at level index to result if not exists
    if ([result count] < level + 1) {
        [result addObject:@[]];
    }
    
    NSArray * subArray = result[level];
    
    [result replaceObjectAtIndex:level withObject:[subArray arrayByAddingObject:item]];
    
    level++;
    
    if ([[root left] isKindOfClass:[BinaryNode class]]) {
        result = [self levelOrderTraversal:[root left] result:result level:level];
    }
    
    if ([[root right] isKindOfClass:[BinaryNode class]]) {
        result = [self levelOrderTraversal:[root right] result:result level:level];
    }
    
    return result;
    
}

- (BinaryNode *)createNode:(NSNumber *)val {
    
    BinaryNode * node = [[BinaryNode alloc] init];
    
    node.data = val;
    
    node.parent = nil;
    node.left = nil;
    node.right = nil;
    
    return node;
}

@end
