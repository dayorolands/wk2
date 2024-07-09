//
//  UserRepository.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import Foundation


protocol UserRepository {
    func fetchUsers()  -> [User]
}
