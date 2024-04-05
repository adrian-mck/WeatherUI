//
//  WeatherButton.swift
//  WeatherUI
//
//  Created by Adrian Mück on 25.01.24.
//

import SwiftUI


struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
        .frame(width: 280, height: 50)
        .background(backgroundColor.gradient)
        .foregroundColor(textColor)
        .font(.system(size: 20, weight: .semibold , design: .default))
        .cornerRadius(10)
    }
}
