//
//  ViewController.swift
//  NavigationManager_UIKit
//
//  Created by padmaja nagarajan on 11/27/24.
//

import UIKit
import SwiftUI

struct ContentView1: View {
    @ObservedObject var viewModel: ContentViewModel1
    var body: some View {
        VStack {
            Text(viewModel.title)
                .onTapGesture {
                    viewModel.didTapPrimaryButton()
                }
        }
        .navigationTitle("Super!")
    }
}
struct ContentView2: View {
    @ObservedObject var viewModel: ContentViewModel2
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}
struct ContentView3: View {
    @ObservedObject var viewModel: ContentViewModel3
    var body: some View {
        VStack {
            Text(viewModel.title)
        }
        .navigationTitle("Super!")
    }
}
struct ContentView4: View {
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

class ContentViewModel1: ObservableObject {
    @Published var title: String = "Hello World1!"
    static var id = "1"
    
    func didTapPrimaryButton() {
        NavigationManager.shared.navigateTo(id: 2, presentationStyle: .push)
    }
}

class ContentViewModel2: ObservableObject {
    @Published var title: String = "Hello World2!"
    static var id = "2"
}

class ContentViewModel3: ObservableObject {
    @Published var title: String = "Hello World3!"
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

let contentView1 = ContentView1(viewModel: ContentViewModel1())
let contentView2 = ContentView2(viewModel: ContentViewModel2())
let contentView3 = ContentView3(viewModel: ContentViewModel3())
let contentView4 = ContentView4(viewModel: ContentViewModel4())
let contentView5 = ContentView5(viewModel: ContentViewModel5())
let contentView6 = ContentView6(viewModel: ContentViewModel6())
let contentView7 = ContentView7(viewModel: ContentViewModel7())
let contentView8 = ContentView8(viewModel: ContentViewModel8())

let rootVC1 = UIHostingController(rootView: contentView1)
let vc2 = UIHostingController(rootView: contentView2)
let vc3 = UIHostingController(rootView: contentView3)
let vc4 = UIHostingController(rootView: contentView4)
let vc5 = UIHostingController(rootView: contentView5)
let vc6 = UIHostingController(rootView: contentView6)
let vc7 = UIHostingController(rootView: contentView7)
let vc8 = UIHostingController(rootView: contentView8)
