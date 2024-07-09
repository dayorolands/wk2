//
//  UserListView.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import SwiftUI

struct UserListView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                HStack {
                    Text("\(user.id).")
                    Text(user.name)
                }
                
            }
            .navigationTitle("Users")
            .fontWeight(.heavy)
            .backgroundStyle(.white)
        
        }
    }
}

#Preview {
    UserListView()
        .environmentObject(UserViewModel(userRepository: MockRepository()))
}
