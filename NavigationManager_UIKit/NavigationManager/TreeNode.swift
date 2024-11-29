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
    
    func resolveView() -> AnyView? {
        guard let (anyViewType, anyViewModelType) = NavigationNode.keyToViewMappings[id] else {
            print("No mapping found for screen: \(id)")
            return nil
        }
        
        return resolveViewWithTypes(
            viewType: anyViewType,
            viewModelType: anyViewModelType
        )
    }
    
    private func resolveViewWithTypes<ViewType: NavigableView, ViewModelType: NavigableViewModel>(
        viewType: ViewType.Type,
        viewModelType: ViewModelType.Type
    ) -> AnyView {
        let viewModel = viewModelType.init(node: self) 
        let view = viewType.init(viewModel: viewModel as! ViewType.ViewModel)
        return AnyView(view)
    }
    
    static var keyToViewMappings: [String: (any NavigableView.Type, any NavigableViewModel.Type)] =
    [
        "CashoutWheel": (ContentView1.self, ContentViewModel1.self),
        "TransferSpeedOptions": (ContentView2.self, ContentViewModel2.self),
        "NoTipDefaults": (ContentView3.self, ContentViewModel3.self)
    ]
}

protocol NavigableViewModel {
    init(node: NavigationNode)
}

protocol NavigableView: View {
    associatedtype ViewModel: NavigableViewModel
    init(viewModel: ViewModel)
}
