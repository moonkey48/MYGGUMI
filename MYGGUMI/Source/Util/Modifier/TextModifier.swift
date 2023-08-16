//
//  TextModifier.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

struct TextModifier: ViewModifier {
    var fontSize: CGFloat = 18
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .foregroundColor(.textGray)
            .padding(.bottom, 16)
            .lineSpacing(7)
    }
}
