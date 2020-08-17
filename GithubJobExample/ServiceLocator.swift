//
//  ServiceLocator.swift
//  GithubJobExample
//
//

protocol ServiceLocating {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceLocating {
    public static let shared = ServiceLocator()

    private lazy var services: Dictionary<String, Any> = [:]

    private init() {}
    
    private func typeName(some: Any) -> String {
        return (some is Any.Type) ?
            "\(some)" : "\(type(of: some))"
    }

    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        print(key)
        services[key] = service
    }

    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        print(key)
        return services[key] as? T
    }
    
    func getServiceUnsafe<T>() -> T {
        guard let service: T = getService() else {
            fatalError("service \(T.self) not found")
        }
        return service
    }
}
