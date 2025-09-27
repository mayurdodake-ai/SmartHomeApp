//
//  Light.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import Foundation

class Light: ObservableObject {
    @Published var isOn: Bool = false
    
    func toggle() {
        isOn.toggle()
    }
    
    func setState(_ state: Bool) {
        isOn = state
    }
}
