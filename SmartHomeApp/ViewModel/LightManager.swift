//
//  LightManager.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import SwiftUI
import Combine

class LightManager: ObservableObject {
    static let shared = LightManager()
    
    @Published var lights: [Int: Bool] = [
        1: false,
        2: false,
        3: false,
        4: false
    ]
    
    private init() {}
    
    func toggle(light number: Int, turnOn: Bool) {
        lights[number] = turnOn
    }
    
    func toggleAll() {
        for key in lights.keys {
            lights[key]?.toggle()
        }
    }
}
