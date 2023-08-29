//
//  FindValueMainView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

struct FindValueMainView: View {
    var body: some View {
        BackgroundView { geo in
            VStack(spacing: 0) {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                VStack(spacing: 25) {
                    NavigationLink {
                        ChatWithGGUMI()
                            .navigationBarBackButtonHidden()
                    } label: {
                        RectangleView(width: 265, height: 105, text: "꾸미와 채팅")
                    }
                    NavigationLink {
                        ShareWithGGUMI()
                            .navigationBarBackButtonHidden()
                    } label: {
                        RectangleView(width: 265, height: 105, text: "꾸미와 일상공유")
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct FindValueMainView_Previews: PreviewProvider {
    static var previews: some View {
        FindValueMainView()
    }
}
