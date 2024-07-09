//
//  wk2App.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import SwiftUI

@main
struct wk2App: App {
    var body: some Scene {
        WindowGroup {
            UserListView()
                .environmentObject(UserViewModel(userRepository: makeUseOfMockRepository()))
        }
    }
    
    func makeUseOfMockRepository() -> UserRepository{
        return MockRepository()
    }
}
