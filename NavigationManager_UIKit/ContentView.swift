//
//  ViewController.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import UIKit
import SwiftUI

struct ContentView1: View, NavigableView {
    @ObservedObject var viewModel: ContentViewModel1
    
    init(viewModel: ContentViewModel1) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text(viewModel.title)
                .onTapGesture {
                    viewModel.didTapPrimaryButton()
                }
        }
        .navigationTitle("Super 1!")
    }
}

class ContentViewModel1: ObservableObject, NavigableViewModel {
    let id: String
    
    required init(node: NavigationNode) {
        self.id = node.id
    }
    
    @Published var title: String = "Hello World 167!"
    
    func didTapPrimaryButton() {
        NavigationManager.shared.navigateTo(id: 2, presentationStyle: .push)
    }
}

// MARK: Views
struct ContentView2: View, NavigableView {
    @ObservedObject var viewModel: ContentViewModel2
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super 2!")
    }
}
struct ContentView3: View, NavigableView {
    @ObservedObject var viewModel: ContentViewModel3
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super 3!")
    }
}

class ContentViewModel2: ObservableObject, NavigableViewModel {
    var id: String
    required init(node: NavigationNode) {
        self.id = node.id
    }

    @Published var title: String = "Hello World 2!"
}

class ContentViewModel3: ObservableObject, NavigableViewModel {
    var id: String
    required init(node: NavigationNode) {
        self.id = node.id
    }

    @Published var title: String = "Hello World 3!"
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

