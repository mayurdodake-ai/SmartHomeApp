//
//  LightStateManager.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import Foundation

class LightStateManager {
    static let shared = LightStateManager()

    private let keys = ["light1", "light2", "light3", "light4"]

    func setLight(index: Int, to state: Bool) {
        guard index >= 1 && index <= 4 else { return }
        UserDefaults.standard.set(state, forKey: keys[index - 1])
        DispatchQueue.main.async {
            LightManager.shared.lights[index] = state
        }
    }

    func getLight(index: Int) -> Bool {
        guard index >= 1 && index <= 4 else { return false }
        return UserDefaults.standard.bool(forKey: keys[index - 1])
    }

    func toggleAll() {
        for index in 1...4 {
            let current = getLight(index: index)
            let newState = !current
            setLight(index: index, to: newState)
            // No need to update LightManager.shared.lights here, setLight already does it on main thread
        }
    }

    func getAllLights() -> [Bool] {
        return (1...4).map { getLight(index: $0) }
    }
}
