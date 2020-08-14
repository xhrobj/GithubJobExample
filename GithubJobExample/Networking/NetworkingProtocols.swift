//
//  NetworkingProtocols.swift
//  GithubJobExample
//


protocol PositionsNetworking {
    func findPositions(description: String?, page: Int?, completion: @escaping ((_ data: [Position]?,_ error: Error?) -> Void))
}

protocol NetworkingFabric {
    var api: PositionsNetworking { get }
}
