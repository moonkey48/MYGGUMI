//
//  MainView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/22.
//

import SwiftUI

struct MainView: View {
    @StateObject private var mainObservable = MainObservable.shared
    @StateObject private var missionObservable = MissionObservable.shared
    
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
                    if missionObservable.isCharacterCustomCompleted {
                        Image("main_profile")
                            .padding(.bottom, 20)
                    } else {
                        Image("main_question")
                            .padding(.bottom, 20)
                    }
                    HStack(spacing: 30) {
                        if missionObservable.missionList[0].isComplete {
                            Text("#창의력")
                                .description(.white, 17)
                        }
                        else {
                            Text("#능력")
                                .description(.white, 17)
                        }
                        if missionObservable.missionList[1].isComplete {
                            Text("#즐거움")
                                .description(.white, 17)
                        } else {
                            Text("#가치")
                                .description(.white, 17)
                        }
                        if missionObservable.missionList[2].isComplete {
                            Text("#도전성")
                                .description(.white, 17)
                        } else {
                            Text("#가치")
                                .description(.white, 17)
                        }
                    }
                    // MARK: Dream
                    ZStack {
                        Image("main_gradient")
                        if missionObservable.missionList[1].isComplete && missionObservable.missionList[2].isComplete {
                            Text("다양한 감정을 초등학생에게\n아름답게 전달하는 사람")
                                .multilineTextAlignment(.center)
                                .description()
                        } else {
                            Text("나의 동사형 꿈")
                                .multilineTextAlignment(.center)
                                .description()
                        }
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
                    if missionObservable.isCharacterCustomCompleted {
                        Button {
                            mainObservable.showSpaceFromMain = true
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(.white.opacity(0.1))
                                    .frame(width: 280, height: 128)
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .stroke(.white, lineWidth: 2)
                                    .frame(width: 280, height: 128)
                                Text("직업우주")
                                    .description()
                            }
                        }
                    } else {
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
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $mainObservable.showFindValueFromMain) {
                FindValueMainView()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $mainObservable.showMissionFromMain) {
                MissionPage()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $mainObservable.showSpaceFromMain) {
                JobSpaceView()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $mainObservable.showChatFromMain) {
                ChatWithGGUMI()
                    .navigationBarBackButtonHidden()
            }
            .navigationDestination(isPresented: $mainObservable.showFriendListFromMain) {
                FriendListView()
                    .navigationBarBackButtonHidden()
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
