//
//  FriendDetailView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

struct FriendDetailView: View {
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                VStack(spacing: 0) {
                    Text("유마이")
                        .padding(.bottom, 20)
                    NavigationLink {
                        CharacterCustomView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image("profile_full")
                    }
                    HStack {
                        Text("#도전")
                        Text("#창의성")
                        Text("#예술")
                    }
                    .description(.white, 16)
                    .padding(.top, 30)
                    ZStack {
                        Image("textBG_small")
                        Text("새로운 시각을\n그래픽으로 표현하는 사람")
                            .multilineTextAlignment(.center)
                    }
                    Text("마이의 관심직업")
                        .padding(.bottom, 40)
                    ZStack {
                        Image("FriendDetailJob_BG")
                        HStack {
                            RoundedRectangle(cornerRadius: 37, style: .continuous)
                                .fill(.white.opacity(0.6))
                                .frame(width: 85, height: 110)
                            ZStack {
                                RoundedRectangle(cornerRadius: 37, style: .continuous)
                                    .fill(LinearGradient(
                                        gradient: .init(colors: [Color(.lightPurple), .white.opacity(0.8)]),
                                        startPoint: .init(x: 0.5, y: 0.2),
                                      endPoint: .init(x: 0.5, y: 0.6)
                                    ))
                                    .frame(width: 115, height: 150)
                                VStack(alignment: .leading) {
                                    Text("영상 디자이너")
                                        .description(.purple, 11)
                                        .padding(.top, 10)
                                    Text("#디자인 #예술 #adobe")
                                        .description(.white, 8)
                                    Spacer()
                                }
                                Image("video_designer_graphic")
                                    .offset(x: 5, y: 30)
                            }
                            RoundedRectangle(cornerRadius: 37, style: .continuous)
                                .fill(.white.opacity(0.6))
                                .frame(width: 85, height: 110)
                        }
                        .offset(y: -20)
                    }
                }
                .description()
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView()
    }
}
