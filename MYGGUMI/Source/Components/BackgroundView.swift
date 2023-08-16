//
//  BackgroundView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                // 수정중 정렬 맞춤 정령에 필요없는 코드는 다시 정리
                ZStack {
                    Image("mainBG")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .frame(width: .infinity, height: .infinity)
                        
                    content()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
