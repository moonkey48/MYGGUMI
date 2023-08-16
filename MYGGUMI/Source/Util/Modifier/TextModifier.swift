//
//  TextModifier.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

struct DescriptionModifier: ViewModifier {
    var fontSize: CGFloat = 18
    var color: CustomColor = .white
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(color))
            .font(.system(size: fontSize))
            .lineSpacing(7)
    }
}
