//
//  RepositoryRegistration.swift
//  MovieLatte
//
//  Created by YILDIRIM on 4.01.2023.
//

import Foundation
import Resolver

extension DependencyRegistrationService{
    func registerRepositories(){
        Resolver.register { SearchRepository() as SearchRepositoryProtocol }
    }
}
