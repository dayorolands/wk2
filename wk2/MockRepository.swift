//
//  MockRepository.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/9/24.
//

import Foundation

//Mock implementation of the repository
class MockRepository : UserRepository {
    func fetchUsers() -> Result<[User], Error> {
        let sampleJsonObject = """
        [
            { "id": 1, "name":"Munachi Ernest Eze" },
            { "id": 2, "name":"Ama Esther Ansah" },
            { "id": 3, "name":"Obayagbona Uwagbae Alexander" },
            { "id": 4, "name":"Robert Haughton" },
            { "id": 5, "name":"Ibukunoluwa Sanni" },
            { "id": 6, "name":"Yahya Ali" }
        ]
        """
        let data = Data(sampleJsonObject.utf8)
        do {
            let users = try JSONDecoder().decode([User].self, from: data)
            return .success(users)
        } catch {
            return .failure(error)
        }
    }
}
