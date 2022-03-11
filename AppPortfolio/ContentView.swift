//
//  ContentView.swift
//  AppPortfolio
//
//  Created by Trevor Schmidt on 3/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.apps) { app in
                    AppView(app: app)
                }
            }
                .navigationTitle("Trevor's Apps")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    viewModel.onAppear()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .navigationViewStyle(.stack)
    }
}
