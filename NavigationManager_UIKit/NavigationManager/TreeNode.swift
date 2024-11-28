//
//  TreeNode.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/28/24.
//

import Foundation

struct Node: Decodable {
    var id: String
    var children: [Node]
    var presentationStyle: PresentationStyle
}
