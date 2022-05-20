//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mahbubur Rashid Leon on 19/5/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter City Name", text: $weatherVM.cityName) {
                weatherVM.search()
            }
            .font(.custom("Arial", size: 40))
            .fixedSize()
            .padding()
            
            Text(weatherVM.temperature)
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
