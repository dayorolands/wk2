//
//  User.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import Foundation

//User model to identify who the users are
struct User: Identifiable, Codable {
    let id : Int //the unique identifier for a user
    let name : String //the name of a user
}
