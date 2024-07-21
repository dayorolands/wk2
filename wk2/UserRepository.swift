//
//  UserRepository.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import Foundation

// Repository protocol to define the business logic required to fetch data from a data source
protocol UserRepository {
    func fetchUsers()  -> Result<[User], Error>
}
