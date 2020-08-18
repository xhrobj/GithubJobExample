//
//  OpenApiManager.swift
//  GithubJobExample
//
//

import Foundation
import GithubJobAPI
import GithubJobServices

extension PositionJSON: PositionDTO {
    
}

final class OpenApiAdapter: PositionNetworkManager {
    
    func fetchPositions(description: String?, page: Int?, apiResponseQueue: DispatchQueue, completion: @escaping ((_ data: [PositionDTO]?,_ error: Error?) -> Void)) {
        
        PositionsAPI.findPositionsByDescription(description: description, page: page, apiResponseQueue: apiResponseQueue, completion: completion)
    }
}
