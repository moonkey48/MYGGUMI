//
//  BackgroundView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    
    @State private var xTop: CGFloat = -150
    @State private var xBottom: CGFloat = 200
    
    let content: (_ geo: GeometryProxy) -> Content
    
    init(@ViewBuilder content: @escaping (_ geo: GeometryProxy) -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                // 수정중 정렬 맞춤 정령에 필요없는 코드는 다시 정리
                ZStack {
                    Image("BG_global")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                        .frame(width: geo.size.width, height: geo.size.height)
                    Image("BG_top")
                        .offset(x: xTop, y: -450)
                    Image("BG_bottom")
                        .offset(x: xBottom, y: 300)
                    content(geo)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 10).repeatForever()) {
                xTop = -50
                xBottom = 100
            }
        }
    }
}
