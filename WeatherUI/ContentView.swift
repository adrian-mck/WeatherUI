//
//  ContentView.swift
//  WeatherUI
//
//  Created by Adrian Mück on 25.01.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            
            BackgroundView(isNight: isNight)
            VStack{
                CityNameView(cityName: "Cupertino, CA")

                TodayWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20){
                    
                    WeatherDayView(dayOfWeek: "TUE", 
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 80)
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 72)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.heavyrain.fill",
                                   temperature: 70)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temperature: 94)
                   
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", 
                                  textColor: .white,
                                  backgroundColor: .mint)
                }
                Spacer()

                
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(alignment: .center){
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
     
        //  If you want to do a really specific gradient
        
        //        LinearGradient(gradient: Gradient(  colors: [isNight ? .black : .blue, isNight ? .gray : .lightBlue]),
        //                       startPoint: .topLeading,
        //                       endPoint: .bottomTrailing)
        //        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
        
        
    }
}

struct CityNameView: View {

    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

