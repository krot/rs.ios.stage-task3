//
//  BinaryNode.m
//  ios.stage-task
//
//  Created by Rust Enikeev on 5/24/21.
//

#import <Foundation/Foundation.h>
#import "BinaryNode.h"


@implementation BinaryNode

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    id copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {

        [copy setData:[self.data copyWithZone:zone]];
        
        [copy setParent:[self.data copyWithZone:zone]];
        [copy setLeft:[self.left copyWithZone:zone]];
        [copy setRight:[self.right copyWithZone:zone]];

    }

    return copy;
}


@end
