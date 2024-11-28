//
//  NavigationManager.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import Foundation
import UIKit

final class NavigationManager {

    static var shared: NavigationManager { NavigationManager() }

    private init() {}
    
    func setRootVC(rootVC: UIViewController) -> UINavigationController {
        return UINavigationController(rootViewController: rootVC)
    }
}
