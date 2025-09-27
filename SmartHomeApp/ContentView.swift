//
//  ContentView.swift
//  SmartHomeApp
//
//  Created by Mayur Dodake on 26/09/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = LightManager.shared
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                ToggleLightView(label: "Light 1", isOn: binding(for: 1), index: 1)
                ToggleLightView(label: "Light 2", isOn: binding(for: 2), index: 2)
                ToggleLightView(label: "Light 3", isOn: binding(for: 3), index: 3)
                ToggleLightView(label: "Light 4", isOn: binding(for: 4), index: 4)
                
                Spacer()
                
                Button(action: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.6)) {
                        manager.toggleAll()
                    }
                }) {
                    Text("Toggle All Lights")
                        .font(.title2.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(colors: [.yellow, .orange],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .foregroundColor(.black)
                        .cornerRadius(25)
                        .shadow(color: .yellow.opacity(0.7), radius: 15, x: 0, y: 0)
                }
                .padding(.horizontal, 40)
            }
        }
        .navigationTitle("💡 Smart Home")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func binding(for index: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { manager.lights[index] ?? false },
            set: { newValue in manager.lights[index] = newValue }
        )
    }
}

struct ToggleLightView: View {
    let label: String
    @Binding var isOn: Bool
    let index: Int

    var body: some View {
        Toggle(isOn: $isOn.animation(.easeInOut(duration: 0.4))) {
            Label(label, systemImage: isOn ? "lightbulb.fill" : "lightbulb")
                .font(.title2)
                .foregroundColor(isOn ? .yellow : .white)
        }
        .onChange(of: isOn) {
            LightStateManager.shared.setLight(index: index, to: isOn)
        }
        .toggleStyle(SwitchToggleStyle(tint: .yellow))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.15))
                .shadow(color: isOn ? .yellow.opacity(0.7) : .clear, radius: 15)
        )
        .padding(.horizontal, 40)
    }
}

#Preview {
    ContentView()
}
