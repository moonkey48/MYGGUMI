//
//  RectangleView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct RectangleView: View {
    @State var width: CGFloat = 200
    @State var height: CGFloat = 200
    @State var text = "default"
    @State var backgroundColor = Color.white.opacity(0.1)
    @State var foregroundColor: CustomColor = .white
    @State var cornerRadius: CGFloat = 25
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .fill(backgroundColor)
                .frame(width: width, height: height)
            RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                .stroke(.white, lineWidth: 2)
                .frame(width: width, height: height)
            Text(text)
                .lineSpacing(-10)
                .description(foregroundColor, 16)
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
