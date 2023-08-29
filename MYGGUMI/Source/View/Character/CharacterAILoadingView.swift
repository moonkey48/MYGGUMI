//
//  CharacterAILoadingView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

struct CharacterAILoadingView: View {
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                ZStack {
                    Image("textBG_circle")
                    Text("AI가 당신의 얼굴을\n캐릭터에 적용 중입니다!\n잠시만 기다려주세요")
                        .description()
                        .multilineTextAlignment(.center)
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct CharacterAILoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAILoadingView()
    }
}
