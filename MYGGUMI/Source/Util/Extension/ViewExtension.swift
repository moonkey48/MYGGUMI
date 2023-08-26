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
    @ViewBuilder func applyTextColor(_ color: Color) -> some View {
        if UITraitCollection.current.userInterfaceStyle == .light {
          self.colorInvert().colorMultiply(color)
        } else {
          self.colorMultiply(color)
        }
    }
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
            clipShape( RoundedCorner(radius: radius, corners: corners) )
        }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
