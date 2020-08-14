//
//  PositionList.swift
//  GithubJobExample
//
//

import SwiftUI

struct PositionListView: View {
    
    var positions: [Position]
    
    var body: some View {
        NavigationView {
            List(positions, id: \.id) { position in
                PositionRowView(position: position)
            }
        }
    }
}

struct PositionRowView: View {
    
    var position: Position
    
    var body: some View {
        NavigationLink(destination: PositionDetailView(position: position)) {
            VStack(alignment: .leading, spacing: 10) {
                Text(position.title)
                Text(position.company)
            }
        }
        .navigationBarTitle("Positions")
    }
}
