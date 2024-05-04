//
//  Colors.swift
//  TopUsers
//
//  Created by Jidh George on 03/05/2024.
//

import SwiftUI
/**:
    Extension for Colors.
 */
extension Color {
    static let primaryNavyBlue = fromHexString("#144580")
    static let primarylightGreen = fromHexString("#CEFAD0")
    
    static let offWhite = fromHexString("#FFFFCC")
    
    static func fromHexString(_ hex:String) -> Color {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        return Color(red: r, green: g, blue: b)
    }
}
