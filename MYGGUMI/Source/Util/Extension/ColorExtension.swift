//
//  Color.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

enum CustomColor {
    case white
    case black
    case purple
    case lightPurple
    case lightGray
}

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
    
    init(_ color: CustomColor) {
        switch color {
        case .white:
            self.init(hex: "#ffffff")
        case .black:
            self.init(hex: "#000000")
        case .purple:
            self.init(hex: "#251260")
        case .lightPurple:
            self.init(hex: "#746EA9")
        case .lightGray:
            self.init(hex: "#EFF0F0")
        }
    }
}
