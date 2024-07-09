//
//  UserViewModel.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import Foundation

//Viewmodel implementation connecting the repository to the view.

@MainActor
class UserViewModel: ObservableObject {
    @Published var users : [User] = []
    
    private let userRepository : UserRepository
    
    init(userRepository: UserRepository){
        self.userRepository = userRepository
        fetchUsers()
    }
    
    func fetchUsers() {
        self.users = userRepository.fetchUsers()
    }
}
