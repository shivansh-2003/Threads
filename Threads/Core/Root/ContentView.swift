//
//  ContentView.swift
//  Threads
//
//  Created by Shivansh Mahajan on 14/04/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = ContentViewModel()

    var body: some View {
        Group {
            if viewmodel.userSession != nil {
                ThreadsTabView()
            } else {
                Text("User session is nil")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
