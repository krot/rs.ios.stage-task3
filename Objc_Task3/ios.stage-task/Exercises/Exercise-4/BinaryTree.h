//
//  BinaryTree.h
//  ios.stage-task
//
//  Created by Rust Enikeev on 5/24/21.
//

#ifndef BinaryTree_h
#define BinaryTree_h


#endif /* BinaryTree_h */

#import <Foundation/Foundation.h>
#import "BinaryNode.h"

@interface BinaryTree : NSObject

@property (nonatomic, strong) BinaryTree *root;

- (BinaryNode *)buildTreeFromPreorder: (NSArray *)preorder start:(int)start end:(int)end;

- (NSMutableArray *)levelOrderTraversal: (BinaryNode *)root result:(NSMutableArray *)result level:(int)level;
//- (BinaryNode *)createNode:(NSNumber *)val;

@end
