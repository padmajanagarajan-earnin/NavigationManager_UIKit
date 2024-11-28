//
//  NavigationManager.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import Foundation
import UIKit

final class NavigationManager {

    static var shared = NavigationManager()
    private var navigationController = UINavigationController()
    private var rootNode: Node

    private init() {
        loadConfiguration(from: "nodeGraph")
    }
    
    func setRootVC(rootVC: UIViewController) -> UINavigationController {
        navigationController.setViewControllers([rootVC], animated: true)
        return navigationController
    }
    
    func loadConfiguration(from jsonFile: String) {
        guard
            let jsonFile = Bundle.main.url(forResource: jsonFile, withExtension: "json"),
            let data = try? Data(contentsOf: jsonFile)
        else { return }
        do {
            rootNode = try JSONDecoder().decode(Node.self, from: data)
        }
        catch {
            print("incorrect json format")
        }
        
    }

    // home1 -> cashout2
    func navigateTo(id: Int, presentationStyle: PresentationStyle) {
        // if the node is a child
        // home -> cashout -> home
        switch presentationStyle {
        case .push:
            navigationController.pushViewController(vc2, animated: true)
        default:
            navigationController.pushViewController(vc8, animated: true)
        }
    }

}

enum PresentationStyle {
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
