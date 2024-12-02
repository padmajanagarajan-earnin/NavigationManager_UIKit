//
//  NavigationManager_UIKitTests.swift
//  NavigationManager_UIKitTests
//
//  Created by padmaja nagarajan on 11/27/24.
//

import XCTest
@testable import NavigationManager_UIKit
import SwiftUI

final class NavigationNodeTests: XCTestCase {
    func testNodeInitialization() throws {
        let jsonString =
        """
        {
            "id": "CashoutWheel",
            "presentationStyle": "push",
            "children": []
        }
        """
        let node = try? JSONDecoder().decode(NavigationNode.self, from: Data(jsonString.utf8))
        XCTAssertEqual(node?.id, "CashoutWheel")
        let unwrappedNode = try XCTUnwrap(node)
        XCTAssertTrue(unwrappedNode.children.isEmpty)
    }
    
    func testNodeToViewResolving() throws {
        // Define the JSON input for the test
        let jsonString = """
        {
            "id": "CashoutWheel",
            "presentationStyle": "push",
            "children": []
        }
        """
        
        // Decode the JSON into a NavigationNode
        let node = try XCTUnwrap(
            try? JSONDecoder().decode(NavigationNode.self, from: Data(jsonString.utf8)),
            "Failed to decode NavigationNode from JSON."
        )
        
        // Assert that the node's id matches the expected value
        XCTAssertEqual(node.id, "CashoutWheel", "Node ID does not match the expected value.")
        
        // Resolve the view and view model
        let (resolvedView, resolvedViewModel) = try XCTUnwrap(node.resolveViewAndViewModel())
        
        // Assert that the resolved view and view model are not nil
        XCTAssertNotNil(resolvedView, "Resolved view is nil.")
        XCTAssertNotNil(resolvedViewModel, "Resolved view model is nil.")
        
        // Assert that the types of the resolved view and view model match the expected types
        XCTAssertTrue(
            type(of: resolvedViewModel) == CashoutWheelView.ViewModel.self,
            "Resolved view model type does not match expected type \(CashoutWheelView.ViewModel.self)."
        )
        
        // Extract the underlying view from AnyViewStorage
        if let anyView = resolvedView {
            let mirror = Mirror(reflecting: anyView)
            for child in mirror.children {
                let storageMirror = Mirror(reflecting: child.value)
                if let wrappedView = storageMirror.children.first?.value {
                    XCTAssertTrue(
                        String(describing: type(of: wrappedView)) == String(describing: CashoutWheelView.self),
                        "Wrapped view type does not match \(CashoutWheelView.self)."
                    )
                    break
                }
            }
        } else {
            XCTFail("Resolved view is not of type AnyView.")
        }
    }
    
    func testCorrectNodeAsRootNode() throws {
        // Define the JSON input for the test
        let jsonString = """
            {
                "id": "CashoutWheel1",
                "presentationStyle": "push",
                "children": [
                    {
                        "id": "CashoutWheel1",
                        "presentationStyle": "push",
                        "children": [
                            {
                                "id": "CashoutWheel2",
                                "presentationStyle": "push",
                                "children": []
                            }
                        ]
                    }
                ]
            }
            """
        
        // Decode the JSON into a NavigationNode
        let rootNode = try XCTUnwrap(
            try? JSONDecoder().decode(NavigationNode.self, from: Data(jsonString.utf8)),
            "Failed to decode NavigationNode from JSON."
        )

        XCTAssertEqual(rootNode.id, "CashoutWheel1")
        for (index, child) in rootNode.children.enumerated() {
            print("Child \(index) ID: \(child.id)")
        }
    }
}
