//
//  SettingsView.swift
//  Cookcademy
//
//  Created by Alex Archer on 8/5/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("hideOptionalDirections") private var hideOptionalDirections: Bool = false // Toggle for hiding optional directions
    @AppStorage("listBackgroundColor") private var listBackgroundColor = AppColor.background // Background color setting
    @AppStorage("listTextColor") private var listTextColor = AppColor.foreground // Text color setting

    var body: some View {
        NavigationView {
            Form {
                ColorPicker("List Background Color", selection: $listBackgroundColor) // Picker for background color
                    .padding()
                    .listRowBackground(listBackgroundColor)
                ColorPicker("Text Color", selection: $listTextColor) // Picker for text color
                    .padding()
                    .listRowBackground(listBackgroundColor)
                Toggle("Hide Optional Steps", isOn: $hideOptionalDirections) // Toggle for hiding optional steps
                    .padding()
                    .listRowBackground(listBackgroundColor)
            }
            .foregroundColor(listTextColor)
            .navigationTitle("Settings") // Navigation title for the settings page
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
