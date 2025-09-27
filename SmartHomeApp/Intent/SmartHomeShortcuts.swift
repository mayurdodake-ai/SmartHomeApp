//
//  SmartHomeShortcuts 2.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import AppIntents

struct SmartHomeShortcuts: AppShortcutsProvider {
    @AppShortcutsBuilder
    static var appShortcuts: [AppShortcut] {
        // Light 1
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 1, turnOn: true),
            phrases: ["Turn on light 1 in SmartHomeApp"],
            shortTitle: "Turn On Light 1",
            systemImageName: "lightbulb.fill"
        )
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 1, turnOn: false),
            phrases: ["Turn off light 1 in SmartHomeApp"],
            shortTitle: "Turn Off Light 1",
            systemImageName: "lightbulb"
        )

        // Light 2
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 2, turnOn: true),
            phrases: ["Turn on light 2 in SmartHomeApp"],
            shortTitle: "Turn On Light 2",
            systemImageName: "lightbulb.fill"
        )
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 2, turnOn: false),
            phrases: ["Turn off light 2 in SmartHomeApp"],
            shortTitle: "Turn Off Light 2",
            systemImageName: "lightbulb"
        )

        // Light 3
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 3, turnOn: true),
            phrases: ["Turn on light 3 in SmartHomeApp"],
            shortTitle: "Turn On Light 3",
            systemImageName: "lightbulb.fill"
        )
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 3, turnOn: false),
            phrases: ["Turn off light 3 in SmartHomeApp"],
            shortTitle: "Turn Off Light 3",
            systemImageName: "lightbulb"
        )

        // Light 4
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 4, turnOn: true),
            phrases: ["Turn on light 4 in SmartHomeApp"],
            shortTitle: "Turn On Light 4",
            systemImageName: "lightbulb.fill"
        )
        AppShortcut(
            intent: ToggleSpecificLightIntent(lightNumber: 4, turnOn: false),
            phrases: ["Turn off light 4 in SmartHomeApp"],
            shortTitle: "Turn Off Light 4",
            systemImageName: "lightbulb"
        )

        // Toggle all lights
        AppShortcut(
            intent: ToggleAllLightsIntent(),
            phrases: ["Toggle all lights in SmartHomeApp"],
            shortTitle: "Toggle All Lights",
            systemImageName: "lightbulb.4"
        )
    }
}
