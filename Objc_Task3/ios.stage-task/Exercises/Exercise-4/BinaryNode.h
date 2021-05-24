//
//  BinaryNode.h
//  ios.stage-task
//
//  Created by Rust Enikeev on 5/24/21.
//

#ifndef BinaryNode_h
#define BinaryNode_h


#endif /* BinaryNode_h */

#import <Foundation/Foundation.h>

@interface BinaryNode : NSObject<NSCopying>

@property(nonatomic,strong) NSNumber *data;

@property(nonatomic,strong) BinaryNode *parent;
@property(nonatomic,strong) BinaryNode *left;
@property(nonatomic,strong) BinaryNode *right;

@end
