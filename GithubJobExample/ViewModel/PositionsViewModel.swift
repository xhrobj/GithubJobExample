//
//  PositionsViewModel.swift
//  GithubJobExample
//

import Foundation

protocol Fetchable {
    func fetch()
}

protocol PositionsDataSource {
    func getPositions() -> [Position]
    func getPosition(index: Int) -> Position?
}

final class PositionsViewModel: ObservableObject {
    
    @Published private var positions: [Position] = []
    
    let apiFabric: NetworkingFabric
    
    init(apiFabric: NetworkingFabric) {
        self.apiFabric = apiFabric
    }
}

extension PositionsViewModel: PositionsDataSource {
    func getPositions() -> [Position] {
        positions
    }
    
    func getPosition(index: Int) -> Position? {
        guard index < positions.count else {
            return nil
        }
        return positions[index]
    }
}

extension PositionsViewModel: Fetchable {
    func fetch() {
        apiFabric.api.findPositions(description: "ruby", page: nil) { (positions: [Position]?, error: Error?) in
            if let positions = positions {
                self.positions.append(contentsOf: positions)
            }
        }
    }
}
