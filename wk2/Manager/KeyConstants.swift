//
//  KeyConstants.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import Foundation


enum KeyConstants {
    static func loadApiKey() async throws {
        let request = NSBundleResourceRequest(tags: ["APIKey"])
        try await request.beginAccessingResources()
        let url = Bundle.main.url(forResource: "APIKey", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let apiKey : APIKeysModel = try JSONDecoder().decode(APIKeysModel.self, from: data)
        try storeApiKeyinKeyChain(apiKey : apiKey.api_key)
        request.endAccessingResources()
    }
}

struct APIKeysModel: Decodable {
    let api_key : String
}
