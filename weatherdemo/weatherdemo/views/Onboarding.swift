//
//  Onboarding.swift
//  weatherdemo
//
//  Created by rt on 30/07/2022.
//

import SwiftUI
import CoreLocationUI
struct Onboarding: View {
    @EnvironmentObject var locationManager : MockLocationManager
    
    
    var body: some View {
        VStack{
            VStack(spacing:20){
                Text("Monitor Nairobi Weather")
                    .bold().font(.title)
                Text("Lorem ipsum is sample text that is used as a placeholder by designers and programmers").padding()
            }.multilineTextAlignment(.center)
                .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }.symbolVariant(.fill)
                .foregroundColor(.white)
                .cornerRadius(30)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
