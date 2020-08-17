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

final class OpenApiAdapter: PositionNetworkManager {
    
    func fetchPositions(description: String?, page: Int?, apiResponseQueue: DispatchQueue, completion: @escaping ((_ data: [PositionDTO]?,_ error: Error?) -> Void)) {
        
        PositionsAPI.findPositionsByDescription(description: description, page: page, apiResponseQueue: apiResponseQueue, completion: completion)
    }
}
