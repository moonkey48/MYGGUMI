//
//  MainView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        BackgroundView {
            VStack(spacing: 0) {
                //Header
                HStack(spacing: 0) {
                    Spacer()
                    Image("main_coin")
                        .padding(.trailing, 10)
                    Text("0")
                        .description()
                }
                .padding([.bottom, .horizontal], 20)
                Image("main_question")
                    .padding(.bottom, 20)
                HStack(spacing: 30) {
                    Text("#능력")
                        .description(.white, 17)
                    Text("#가치")
                        .description(.white, 17)
                    Text("#가치")
                        .description(.white, 17)
                }
                // MARK: Dream
                ZStack {
                    Image("main_gradient")
                    Text("나의 동사형 꿈")
                        .description()
                }
                // MARK: Modal
                HStack(spacing: 10) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white.opacity(0.1))
                            .frame(width: 135, height: 135)
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 135, height: 135)
                        Text("칭찬\n하기")
                            .lineSpacing(-10)
                            .description()
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white.opacity(0.1))
                            .frame(width: 135, height: 135)
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(.white, lineWidth: 2)
                            .frame(width: 135, height: 135)
                        Text("가치\n찾기")
                            .lineSpacing(-10)
                            .description()
                    }
                }
                .padding(.bottom, 10)
                // MARK: MainModal
                ZStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.white.opacity(0.1))
                        .frame(width: 280, height: 128)
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .stroke(.white, lineWidth: 2)
                        .frame(width: 280, height: 128)
                    Text("직업우주")
                        .lineSpacing(-10)
                        .description()
                        .offset(y:8)
                    Image("main_lock")
                }
                Spacer()
                Spacer()
                // MARK: Footer
                HStack(spacing: -10) {
                    Image("icon_tab1")
                    Image("icon_tab2")
                    Image("icon_tab3")
                    Image("icon_tab4")
                    Image("icon_tab5")
                }
            }
            .padding(.horizontal,60)
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
