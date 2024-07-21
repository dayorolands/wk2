//
//  WeatherRow.swift
//  wk2
//
//  Created by Dayo Adekoya on 7/13/24.
//

import SwiftUI

struct WeatherRow: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: logo)
                .font(.title)
                .frame(width: 20, height: 20)
                .padding()
                .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.888))
                .cornerRadius(50)
            
            VStack(alignment:.leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(logo: "thermometer", name: "Feels like", value: "8°")
    }
}
