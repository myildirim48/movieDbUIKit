//
//  DependencyRegistrationService.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Resolver

final class DependencyRegistrationService: NSObject, UIApplicationDelegate {
    typealias Registration = () -> Void
    
    private lazy var registrations : [Registration] = [registerService,
                                                       registerRemoteService]
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        register()
    }
    
    private func register() -> Bool {
        Resolver.defaultScope = .graph
        registrations.forEach{ $0() }
        return true
    }
}
