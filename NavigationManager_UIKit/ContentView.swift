//
//  ViewController.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import UIKit
import SwiftUI

struct CashoutWheelView: View, NavigableView {
    @ObservedObject var viewModel: CashoutWheelViewModel

    var body: some View {
        VStack {
            Text(viewModel.title)
                .onTapGesture {
                    viewModel.didTapPrimaryButton()
                }
        }
        .navigationTitle("CashoutWheel!")
    }
}

class CashoutWheelViewModel: ObservableObject, NavigableViewModel {
    let id: String
    
    required init(node: NavigationNode) {
        self.id = node.id
    }
    
    @Published var title: String = "CashoutWheel!"
    
    func didTapPrimaryButton() {
        NavigationManager.shared.navigateToNext()
    }
}

// MARK: Views
struct NoTipDefaultsView: View, NavigableView {
    @ObservedObject var viewModel: NoTipDefaultsViewModel
    var body: some View {
        VStack {
            Text(viewModel.title).onTapGesture {
                viewModel.didTapPrimaryButton()
            }
        }
        .navigationTitle("NoTipDefaults!")
    }
}

class NoTipDefaultsViewModel: ObservableObject, NavigableViewModel {
    var id: String
    required init(node: NavigationNode) {
        self.id = node.id
    }

    @Published var title: String = "NoTipDefaults!"

    func didTapPrimaryButton() {
        NavigationManager.shared.navigateToNext()
    }
}

struct CashoutConfirmationView: View, NavigableView {
    @ObservedObject var viewModel: CashoutConfirmationViewModel
    var body: some View {
        VStack {
            Text(viewModel.title).onTapGesture {
                viewModel.didTapPrimaryButton()
            }
        }
        .navigationTitle("CashoutConfirmation!")
    }
}

class CashoutConfirmationViewModel: ObservableObject, NavigableViewModel {
    var id: String
    required init(node: NavigationNode) {
        self.id = node.id
    }

    @Published var title: String = "CashoutConfirmation!"
    
    func didTapPrimaryButton() {
        NavigationManager.shared.navigateToNext()
    }
}

struct CashoutSummaryView: View, NavigableView {
    @ObservedObject var viewModel: CashoutSummaryViewModel
    var body: some View {
        VStack {
            Text(viewModel.title).onTapGesture {
                viewModel.didTapPrimaryButton()
            }
        }
        .navigationTitle("CashoutSummary!")
    }
}

class CashoutSummaryViewModel: ObservableObject, NavigableViewModel {
    var id: String
    required init(node: NavigationNode) {
        self.id = node.id
    }

    @Published var title: String = "CashoutSummary!"
    
    func didTapPrimaryButton() {
        NavigationManager.shared.navigateToNext()
    }
}
/// ************************************************************
/// ************************************************************
/// ************************************************************
/// ************************************************************

/* struct ContentView4: View {
    @ObservedObject var viewModel: ContentViewModel4
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}
struct ContentView5: View {
    @ObservedObject var viewModel: ContentViewModel5
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}
struct ContentView6: View {
    @ObservedObject var viewModel: ContentViewModel6
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}

struct ContentView7: View {
    @ObservedObject var viewModel: ContentViewModel7
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}

struct ContentView8: View {
    @ObservedObject var viewModel: ContentViewModel8
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}

class ContentViewModel4: ObservableObject {
    @Published var title: String = "Hello World4!"
}

class ContentViewModel5: ObservableObject {
    @Published var title: String = "Hello World5!"
}

class ContentViewModel6: ObservableObject {
    @Published var title: String = "Hello World6!"
}

class ContentViewModel7: ObservableObject {
    @Published var title: String = "Hello World7!"
}
class ContentViewModel8: ObservableObject {
    @Published var title: String = "Hello World8!"
}

let contentView4 = ContentView4(viewModel: ContentViewModel4())
let contentView5 = ContentView5(viewModel: ContentViewModel5())
let contentView6 = ContentView6(viewModel: ContentViewModel6())
let contentView7 = ContentView7(viewModel: ContentViewModel7())
let contentView8 = ContentView8(viewModel: ContentViewModel8())
*/

