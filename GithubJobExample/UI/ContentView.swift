//
//  ContentView.swift
//  GithubJobExample
//
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: PositionsViewModel
    
    var body: some View {
        PositionListView(positions: viewModel.getPositions())
            .onAppear {
                self.viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
