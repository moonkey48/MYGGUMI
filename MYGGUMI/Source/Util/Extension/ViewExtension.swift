//
//  ViewExtension.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

extension View {
    func description(_ color: CustomColor = .white, _ fontSize: CGFloat = 18.0) -> some View {
        modifier(DescriptionModifier(fontSize: fontSize, color: color))
    }
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
