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
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let navigationManager = NavigationManager.shared

        window.rootViewController = navigationManager.rootViewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
