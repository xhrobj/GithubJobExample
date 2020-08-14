//
//  DefaultNetworking.swift
//  GithubJobExample
//

import Foundation
import GithubJobAPI

extension PositionJSON: Position {
    
}

struct DefaultPositionsNetworking: PositionsNetworking {
    func findPositions(description: String?, page: Int?, completion: @escaping (([Position]?, Error?) -> Void)) {
        
        PositionsAPI.findPositionsByDescription(description: description, page: page, apiResponseQueue: DispatchQueue.main, completion: completion)
    }
}

struct DefaultNetworkingFabric: NetworkingFabric {
    var api: PositionsNetworking {
        return DefaultPositionsNetworking()
    }
}
