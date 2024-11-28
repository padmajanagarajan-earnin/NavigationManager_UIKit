//
//  SceneDelegate.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import Foundation
import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        let contentView = ContentView(viewModel: ContentViewModel())
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootVC = UIHostingController(rootView: contentView)
        
        let navigationManager = NavigationManager.shared.setRootVC(rootVC: rootVC)
        
        print("*** \(rootVC.navigationController)")
        window.rootViewController = navigationManager
        self.window = window
        window.makeKeyAndVisible()
    }
}
