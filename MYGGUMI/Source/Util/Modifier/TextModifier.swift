//
//  TextModifier.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

enum CustomFontType: String {
    case aggroL = "OTSBAggroL"
    case aggroM = "OTSBAggroM"
    case aggroB = "OTSBAggroB"
}

struct DescriptionModifier: ViewModifier {
    var fontSize: CGFloat = 18
    var color: CustomColor = .white
    var fontType: CustomFontType = .aggroM
    

    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(color))
            .lineSpacing(7)
            .font(Font.custom(fontType.rawValue,  size: fontSize))
    }
}
