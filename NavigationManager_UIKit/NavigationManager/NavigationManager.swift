//
//  NavigationManager.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import Foundation
import UIKit
import SwiftUI

final class NavigationManager {
    
    static var keyToViewMappings: [String: (any NavigableView.Type, any NavigableViewModel.Type)] =
    [
        "CashoutWheel": (CashoutWheelView.self, CashoutWheelViewModel.self),
        "NoTipDefaults": (NoTipDefaultsView.self, NoTipDefaultsViewModel.self),
        "CashoutConfirmation": (CashoutConfirmationView.self, CashoutConfirmationViewModel.self),
        "Summary": (CashoutSummaryView.self, CashoutSummaryViewModel.self)
    ]

    static var shared = NavigationManager()
    private var navigationController: UINavigationController
    var rootViewController: UIViewController?
    var currentNode: NavigationNode?
    var previousNode: NavigationNode?

    private init() {
        navigationController = UINavigationController()
        loadConfiguration(from: "nodeGraph")
    }
    
    func loadConfiguration(from jsonFile: String) {
        guard
            let jsonFile = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
            let data = try? Data(contentsOf: jsonFile)
        else { return }
        let rootNode = try? JSONDecoder().decode(NavigationNode.self, from: data)
        currentNode = rootNode
        previousNode = rootNode
        let rootVC = UIHostingController(rootView: rootNode?.resolveViewAndViewModel()?.0)
        navigationController.viewControllers = [rootVC]
        rootViewController = navigationController
    }
    
    func navigateToNext() {
        previousNode = currentNode
        let nextNode = currentNode?.next()
        currentNode = nextNode
        let nextVC = UIHostingController(rootView: nextNode?.resolveViewAndViewModel()?.0)
        navigationController.pushViewController(nextVC, animated: true)
    }
    
    func back() {
        navigationController.popViewController(animated: true)
    }
}

enum PresentationStyle: String, Decodable {
    case push
    case modalWithStack
    case singletonModal
    case singletonSheet
    case sheetWithStack
}

enum NavigationBarCustomization {
    case lightMode
    case darkMode
}
