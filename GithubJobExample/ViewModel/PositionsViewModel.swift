//
//  PositionsViewModel.swift
//  GithubJobExample
//

import Foundation
import GithubJobServices

extension Position: PositionDTO {
    init(dto: PositionDTO) {
        id = dto.id
        type = dto.type
        url = dto.url
        company = dto.company
        companyUrl = dto.companyUrl
        location = dto.location
        title = dto.title
        description = dto.description
        howToApply = dto.howToApply
        companyLogo = dto.companyLogo
    }
}

protocol Fetchable {
    func fetch()
}

protocol PositionsDataSource {
    var allPositions: [Position] { get }
    func getPosition(index: Int) -> Position?
}

final class PositionsViewModel: ObservableObject {
    
    @Published private var positions: [Position] = []
    @Published var isLoading = false
    
    private let networkService: PositionNetworkService
    private let storageService: PositionStorageService
    
    init() {
        let networkService: PositionNetworkService = ServiceLocator.shared.getServiceUnsafe()
        let storageService: PositionStorageService = ServiceLocator.shared.getServiceUnsafe()
        self.networkService = networkService
        self.storageService = storageService
        initPositionsByStorage()
    }
    
    private func initPositionsByStorage() {
        self.replace(with: storageService.getAll)
    }
    
    private func replace(with dtoList: [PositionDTO]) {
        positions = dtoList.map{ Position(dto: $0) }
    }
}

extension PositionsViewModel: PositionsDataSource {
    var allPositions: [Position] {
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
        isLoading = true
        networkService.fetchPositions(description: "ruby", page: nil) {
            (positions: [PositionDTO]?, error: Error?) in
            if let positionDTOs = positions {
                self.replace(with: positionDTOs)
                self.isLoading = false
                self.storageService.save(positions: positionDTOs)
            }
        }
    }
}
