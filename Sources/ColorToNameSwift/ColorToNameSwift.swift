// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// The generic and specific name and hex information for a given color.
public struct ColorInfo {
    /// The information for a color's name.
    public struct NameInfo {
        public let name: String
        public let hex: String
    }

    /// The color's original hex string.
    public var originalHex: String
    /// The color name information for the closest generic color to the original hex.
    public var genericName: NameInfo
    /// The color name information for the closest specific color to the original hex.
    public var specificName: NameInfo
}

/// An object that generates color name information based on a hex code.
public struct ColorClassifier {
    public init() { }

    /// Get generic and specific color information for a given hex code.
    /// - Parameter hex: The hex code for the input color.
    /// - Returns: A `ColorInfo` object containing generic and specific name and hex information for the color.
    public func getNames(for hex: String) throws -> ColorInfo {
        let specificColorInfo = try getClosestColor(color: hex, dataSet: getDataSet(for: "specific-colors"))
        // Generic colors sourced from: https://www.rapidtables.com/web/color/html-color-codes.html
        let genericColorInfo = try getClosestColor(color: hex, dataSet: getDataSet(for: "generic-colors"))

        return .init(
            originalHex: hex,
            genericName: .init(name: genericColorInfo.name, hex: genericColorInfo.hex),
            specificName: .init(name: specificColorInfo.name, hex: specificColorInfo.hex))
    }

    private func getDataSet(for fileName: String) throws -> [String: String] {
        guard let fileURL = Bundle.module.url(forResource: fileName, withExtension: "json") else { return [:] }
        let data = try Data(contentsOf: fileURL, options: .mappedIfSafe)
        return try JSONDecoder().decode([String: String].self, from: data)
    }

    private func getClosestColor(color: String, dataSet: [String: String]) throws -> (name: String, hex: String) {
        // Get RBG for original color.
        let (r, g, b) = rgbValue(hex: color)

        // find the closest color
        let closest = dataSet
            .map { (rgb: rgbValue(hex: $0.key), name: $0.value, hex: $0.key) }
            .reduce(into: (min: 10.0, name: "", hex: "")) { acc, current in
                // Get RGB for current color from data set.
                let cr = current.rgb.0
                let cg = current.rgb.1
                let cb = current.rgb.2

                // Calculate difference between colors
                let rd = r - cr
                let gd = g - cg
                let bd = b - cb
                let d = sqrt(rd * rd + gd * gd + bd * bd)

                // Update current values with new lowest sqrt.
                if d < acc.min {
                    acc.min = d
                    acc.name = current.name
                    acc.hex = current.hex
                }
            }

        return (closest.name, closest.hex)
    }

    private func rgbValue(hex: String) -> (CGFloat, CGFloat, CGFloat) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        return (red, green, blue)
    }
}
