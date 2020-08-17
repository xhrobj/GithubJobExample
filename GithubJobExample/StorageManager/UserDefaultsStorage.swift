//
//  UserDefaultsStorageManager.swift
//  GithubJobExample
//
//

import Foundation
import GithubJobServices

final class UserDefaultsStorage: PositionStorageManager {
    
    private let store: UserDefaults = UserDefaults.standard
    private let key = "positions"
    
    var allPositions: [PositionDTO] {
        if let positionsData = store.data(forKey: key),
            let positions = try? JSONDecoder().decode([Position].self, from: positionsData) {
            return positions
        }
        return []
    }
    
    func getPosition(id: String) -> PositionDTO? {
        allPositions.first{ $0.id == id }
    }
    
    func findPositions(searchText: String) -> [PositionDTO] {
        allPositions.filter{ $0.title.contains(searchText) }
    }
    
    func filterPositions(by filter: PositionFilter) -> [PositionDTO] {
        return allPositions.filter {
            $0.company == filter.company ||
            $0.title == filter.title ||
            $0.location == filter.location
        }
    }
    
    func save(positions: [PositionDTO]) {
        DispatchQueue.global().async {
            if let encoded = try? JSONEncoder().encode(positions.map { Position(dto: $0) }) {
                self.store.set(encoded, forKey: self.key)
            }
        }
    }
}
