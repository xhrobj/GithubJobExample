//
//  PositionProtocol.swift
//  GithubJobExample
//

protocol Position {
    var id: String { get }
    var type: String { get }
    var url: String { get }
    var company: String { get }
    var companyUrl: String { get }
    var location: String { get }
    var title: String { get }
    var description: String { get }
    var howToApply: String { get }
    var companyLogo: String { get }
}
