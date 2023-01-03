//
//  RemoteServiceRegistration.swift
//  MovieLatte
//
//  Created by YILDIRIM on 3.01.2023.
//

import Resolver

extension DependencyRegistrationService {
    func registerRemoteService(){
        Resolver.register { SearchRemoteService() as SearchServiceProtocol }
    }
}

