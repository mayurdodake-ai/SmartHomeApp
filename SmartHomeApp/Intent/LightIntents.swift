//
//  LightIntent.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import AppIntents

struct ToggleSpecificLightIntent: AppIntent {
    init() {}
    
    init (lightNumber: Int, turnOn: Bool) {
        self.lightNumber = lightNumber
        self.turnOn = turnOn
    }
    
    static var title: LocalizedStringResource = "Toggle Specific Light"
    
    @Parameter(title: "Light Number")
    var lightNumber: Int
    
    @Parameter(title: "Turn On")
    var turnOn: Bool
    
    typealias Output = String
    
    func perform() async throws -> some ReturnsValue<String> {
        let message = "Light \(lightNumber) is now \(turnOn ? "on" : "off")"
        LightStateManager.shared.setLight(index: lightNumber, to: turnOn)
        print(message)
        return .result(value: message)
    }
}

struct ToggleAllLightsIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle All Lights"
    
    func perform() async throws -> some ReturnsValue<String> {
        LightStateManager.shared.toggleAll()
        print("All lights are on.")
        return .result(value: "All lights On.")
    }
}


enum LightIntentError: LocalizedError {
    case invalidLightNumber
    
    var errorDescription: String? {
        switch self {
        case .invalidLightNumber:
            return "Light number must be between 1 and 4."
        }
    }
}
