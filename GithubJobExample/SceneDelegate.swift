//
//  SceneDelegate.swift
//  GithubJobExample
//
//

import UIKit
import SwiftUI
import GithubJobServices
import GithubJobAPI
import PositionUserDefaultsStorage

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var serviceLocator = ServiceLocator.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setupServiceLocator()
        
        let contentView = ContentView()

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    private func setupServiceLocator() {
        let networkService: PositionNetworkService = PositionNetworkService(apiManager: OpenApiAdapter())
        let storageService: PositionStorageService = PositionStorageService(storageManager: PositionUserDefaultsStorageManager())
        
        serviceLocator.addService(service: networkService)
        serviceLocator.addService(service: storageService)
    }
}

