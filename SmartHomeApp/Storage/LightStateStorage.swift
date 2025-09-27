//
//  LightStateStorage.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import Foundation

class LightStateStorage {
    static let shared = LightStateStorage()
    
    private let key = "light_state"

    func setLightState(to isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: key)
    }

    func getLightState() -> Bool {
        UserDefaults.standard.bool(forKey: key)
    }
}
