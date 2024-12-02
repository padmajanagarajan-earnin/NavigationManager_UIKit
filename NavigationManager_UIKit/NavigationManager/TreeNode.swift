//
//  TreeNode.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/28/24.
//

import Foundation
import SwiftUI

struct NavigationNode: Decodable {
    var id: String
    var children: [NavigationNode]
    var presentationStyle: String
    
    func resolveViewAndViewModel() -> (AnyView?, NavigableViewModel)? {
        guard let (anyViewTypeRef, anyViewModelTypeRef) = NavigationManager.keyToViewMappings[id] else {
            print("No mapping found for screen: \(id)")
            return nil
        }
        
        return resolveViewWithTypes(
            viewType: anyViewTypeRef,
            viewModelType: anyViewModelTypeRef
        )
    }
    
    private func resolveViewWithTypes<ViewType: NavigableView, ViewModelType: NavigableViewModel>(
        viewType: ViewType.Type,
        viewModelType: ViewModelType.Type
    ) -> (AnyView?, NavigableViewModel)? {
        guard let viewModel = viewModelType.init(node: self) as? ViewType.ViewModel else { return nil }
        let view = viewType.init(viewModel: viewModel)
        return (AnyView(view), viewModel)
    }
    
    func next() -> NavigationNode? {
        children.first
    }
}

protocol NavigableViewModel {
    init(node: NavigationNode)
    func didTapPrimaryButton()
}

protocol NavigableView: View {
    associatedtype ViewModel: NavigableViewModel
    init(viewModel: ViewModel)
}
