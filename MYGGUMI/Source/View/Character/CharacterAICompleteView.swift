//
//  CharacterAICompleteView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

struct CharacterAICompleteView: View {
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                Image("character_default")
                ZStack {
                    Image("textBG_small")
                    Text("당신의 얼굴이\n캐릭터에 적용되었습니다!")
                        .description()
                        .multilineTextAlignment(.center)
                }
                RectangleView(width: 228, height: 65, text: "홈으로")
                RectangleView(width: 228, height: 65, text: "캐릭터 세부수정 하러가기")
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct CharacterAICompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAICompleteView()
    }
}
