//
//  JobSpaceIntroView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI
let jobSpaceIntroTitleList = [
    "나의 우주에 온 것을\n환영합니다 :)",
    "나의 우주에서는\n여러분의 가치,능력에 따른\n직업을 마음껏 체험해 볼 수 있어요.",
    "나의 우주로 떠나 볼까요?",
]

struct JobSpaceIntroView: View {
    @State private var currentTitle = jobSpaceIntroTitleList[0]
    @State private var currentTitleIndex = 0
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                Image("character_basic")
                    .padding(.bottom, 20)
                ZStack {
                    Rectangle()
                        .fill(.white.opacity(0.3))
                        .blur(radius: 20)
                        .frame(width: 200, height: 60)
                    Text(currentTitle)
                        .description()
                        .multilineTextAlignment(.center)
                }
                
                
                Spacer()
                CustomTabView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                currentTitle = jobSpaceIntroTitleList[currentTitleIndex + 1]
                currentTitleIndex += 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                currentTitle = jobSpaceIntroTitleList[currentTitleIndex + 1]
                currentTitleIndex += 1
            }
        }
    }
}

struct JobSpaceIntroView_Previews: PreviewProvider {
    static var previews: some View {
        JobSpaceIntroView()
    }
}
