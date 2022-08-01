//
//  ContentView.swift
//  weatherdemo
//
//  Created by rt on 30/07/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = MockLocationManager()
    var weaatherApiManager = WeatherApiManager()
    @State var weather : ResponseBody?
    var body: some View {
        VStack{
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherView(weather: weather)
                }
                else{
                    LoadingView()
                        .task {
                            do{
                                weather = try await weaatherApiManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("error fetching weather: \(error)")
                            }
                        }
                }
            }else {
                if(locationManager.isLoading){
                    LoadingView()
                }else {
                    Onboarding().environmentObject(locationManager)
                }
            }
           
        }
        .background(Color(red: 0.025, green: 0.0, blue: 0.272))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
