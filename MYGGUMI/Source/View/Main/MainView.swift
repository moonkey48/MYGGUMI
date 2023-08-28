//
//  MainView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/22.
//

import SwiftUI

struct MainView: View {
    @StateObject private var mainObservable = MainObservable.shared
    
    var body: some View {
        NavigationStack {
            BackgroundView { geo in
                VStack(spacing: 0) {
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
                        Button {
                            mainObservable.showComplimentFromMain = true
                        } label: {
                            RectangleView(width: 135, height: 135, text: "칭찬\n하기")
                        }
                        Button {
                            mainObservable.showFindValueFromMain = true
                        } label: {
                            RectangleView(width: 135, height: 135, text: "가치\n찾기")
                        }
                    }
                    .padding(.bottom, 10)
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
                    CustomTabView()
                }
                .padding(.horizontal,60)
            }
            .navigationDestination(isPresented: $mainObservable.showComplimentFromMain) {
                ComplimentMainView()
            }
            .navigationDestination(isPresented: $mainObservable.showFindValueFromMain) {
                FindValueMainView()
            }
            .navigationDestination(isPresented: $mainObservable.showMissionFromMain) {
                MissionPage()
            }
            .navigationDestination(isPresented: $mainObservable.showSpaceFromMain) {
                JobSpaceView()
            }
            .navigationDestination(isPresented: $mainObservable.showChatFromMain) {
                ChatWithGGUMI()
            }
            .navigationDestination(isPresented: $mainObservable.showFriendListFromMain) {
                FriendListView()
            }
        }
        .accentColor(.white)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
