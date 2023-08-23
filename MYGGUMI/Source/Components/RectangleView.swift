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
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white.opacity(0.1))
                .frame(width: width, height: height)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(.white, lineWidth: 2)
                .frame(width: width, height: height)
            Text(text)
                .lineSpacing(-10)
                .description(.white, 16)
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleView()
    }
}
