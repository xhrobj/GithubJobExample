//
//  ContentView.swift
//  GithubJobExample
//
//

import SwiftUI
import UICore

public struct ContentView: View {
    
    @ObservedObject var viewModel: PositionsViewModel = PositionsViewModel()
    
    public var body: some View {
        VStack {
            if viewModel.isLoading && viewModel.allPositions.isEmpty {
                FullScreenLoader()
            } else {
                PositionListView(positions: viewModel.allPositions)
            }
        }
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
