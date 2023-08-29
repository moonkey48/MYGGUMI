//
//  CharacterIntroView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

struct CharacterIntroView: View {
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                TopImageView
                ZStack {
                    Image("textBG_big")
                    Text("가치 횟수가 다 채워졌습니다!\n잠금이 풀렸습니다!\n캐릭터를 설정하러 가볼까요?")
                        .multilineTextAlignment(.center)
                        .description()
                }
                NavigationLink {
                    CharacterAIView()
                        .navigationBarBackButtonHidden()
                } label: {
                    RectangleView(width: 210, height: 96, text: "캐릭터 설정하기")
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}
extension CharacterIntroView {
    var TopImageView: some View {
        VStack(spacing: -10) {
            HStack(spacing: -10) {
                Image("character1")
                Image("character2")
            }
            HStack(spacing: -10) {
                Image("character3")
                Image("character4")
            }
        }
    }
}

struct CharacterIntroView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterIntroView()
    }
}
