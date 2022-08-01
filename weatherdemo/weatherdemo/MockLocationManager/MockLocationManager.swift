//
//  MockLocationManager.swift
//  weatherdemo
//
//  Created by rt on 30/07/2022.
//

import Foundation
import CoreLocation


class MockLocationManager : NSObject, ObservableObject {
    @Published var location : CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
    }
    
    func requestLocation(){
        isLoading = true
        
        location = CLLocationCoordinate2D(latitude: 1.2921, longitude: 36.8219)
    }
}
