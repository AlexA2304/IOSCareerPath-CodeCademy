//
//  AppColor.swift
//  Cookcademy
//
//  Created by Alex Archer on 7/30/23.
//

import SwiftUI

struct AppColor {
    static let background = Color(.sRGB, // Static background color property
                                  red: 228 / 255,
                                  green: 235 / 255,
                                  blue: 250 / 255,
                                  opacity: 1)
    static let foreground = Color(.sRGB, // Static foreground color property
                                  red: 118 / 255,
                                  green: 119 / 255,
                                  blue: 231 / 255,
                                  opacity: 1)
}

extension Color: RawRepresentable {
    public init?(rawValue: String) {
        do {
            // Decoding color components from rawValue
            let encodedData = rawValue.data(using: .utf8)!
            let components = try JSONDecoder().decode([Double].self, from: encodedData)
            self = Color(red: components[0], green: components[1], blue: components[2], opacity: components[3])
        }
        catch {
            return nil
        }
    }

    public var rawValue: String {
        guard let cgFloatComponents = UIColor(self).cgColor.components else { return "" }
        let doubleComponents = cgFloatComponents.map { Double($0) }
        do {
            // Encoding color components to rawValue
            let encodedComponents = try JSONEncoder().encode(doubleComponents)
            return String(data: encodedComponents, encoding: .utf8) ?? ""
        }
        catch {
            return ""
        }
    }
}
