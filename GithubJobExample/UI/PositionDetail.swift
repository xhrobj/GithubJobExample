//
//  PositionDetail.swift
//  GithubJobExample
//

import SwiftUI

struct PositionDetailView: View {
    
    var position: Position
    
    var body: some View {
        ScrollView {
            Text(position.title)
            Divider()
            Text(position.type)
            Divider()
            Text(position.location)
            Divider()
            Text(position.company)
            Divider()
            Text(position.description)
                .padding()
        }
        .navigationBarTitle("Job description")
        .navigationBarItems(leading: Text("Positions").foregroundColor(.accentColor), trailing: EmptyView())
    }
}

