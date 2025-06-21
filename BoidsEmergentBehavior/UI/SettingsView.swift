//
//  SettingsView.swift
//  BoidsEmergentBehavior
//
//  Created by Tugberk Masat on 21.06.2025.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var separation: Float
    @Binding var alignment: Float
    @Binding var cohesion: Float
    let onRestart: () -> Void
    
    @State private var separationText: String = "1.0"
    @State private var alignmentText: String = "1.0"
    @State private var cohesionText: String = "1.0"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Settings")
                .font(.largeTitle)
                .bold()
            
            VStack(spacing: 16) {
                ParameterRow(
                    title: "Separation",
                    value: $separation,
                    textValue: $separationText
                )
                
                ParameterRow(
                    title: "Alignment",
                    value: $alignment,
                    textValue: $alignmentText
                )
                
                ParameterRow(
                    title: "Cohesion",
                    value: $cohesion,
                    textValue: $cohesionText
                )
                
                Button(action: onRestart) {
                    HStack {
                        Image(systemName: "arrow.clockwise")
                        Text("Restart Simulation")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .padding(30)
        .background(.thinMaterial)
        .cornerRadius(20)
        .onAppear {
            updateTextValues()
        }
        .onChange(of: separation) { _ in updateTextValues() }
        .onChange(of: alignment) { _ in updateTextValues() }
        .onChange(of: cohesion) { _ in updateTextValues() }
    }
    
    private func updateTextValues() {
        separationText = String(format: "%.1f", separation)
        alignmentText = String(format: "%.1f", alignment)
        cohesionText = String(format: "%.1f", cohesion)
    }
}

struct ParameterRow: View {
    let title: String
    @Binding var value: Float
    @Binding var textValue: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            
            HStack {
                Slider(value: $value, in: 0...5)
                    .onChange(of: value) { newValue in
                        textValue = String(format: "%.1f", newValue)
                    }
                
                TextField("", text: $textValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 60)
                    .onChange(of: textValue) { newValue in
                        if let floatValue = Float(newValue) {
                            value = max(0, min(5, floatValue))
                        }
                    }
            }
        }
    }
} 