//
//  ViewController.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import UIKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}

class ContentViewModel: ObservableObject {
    @Published var title: String = "Hello World!"
}

