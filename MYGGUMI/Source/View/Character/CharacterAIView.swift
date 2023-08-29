//
//  CharacterIntroBeforeAIView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

enum AIViewState: CaseIterable {
    case notMaking
    case photo
    case loading
    case done
}

struct CharacterAIView: View {
    @ObservedObject private var characterObservable = CharacterObservable.shared
    @ObservedObject private var mainObservable = MainObservable.shared
    @State private var aiViewState: AIViewState = .notMaking
    @State private var isCamera = false
    
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                switch aiViewState {
                case .notMaking:
                    IntroAIView
                case .photo:
                    IntroAIView
                case .loading:
                    AILoadingView
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                aiViewState = .done
                            }
                        }
                case .done:
                    AICompleteView
                }
                Spacer()
                CustomTabView()
            }
        }
        .sheet(isPresented: $isCamera) {
            CameraView(aiViewState: $aiViewState)
                .ignoresSafeArea()
        }
    }
}
extension CharacterAIView {
    var IntroAIView: some View {
        Group {
            Image("character_default")
            ZStack {
                Image("textBG_big")
                Text("당신은 12가지 가치 중\n도전의 가치가\n가장 높은 사람입니다!")
                    .multilineTextAlignment(.center)
                    .description()
            }
            Button {
                aiViewState = .photo
                isCamera = true
            } label: {
                RectangleView(width: 210, height: 96, text: "나만의 얼굴로 변경하기")
            }
        }
    }
    var AILoadingView: some View {
        ZStack {
            Image("textBG_circle")
            Text("AI가 당신의 얼굴을\n캐릭터에 적용 중입니다!\n잠시만 기다려주세요")
                .description()
                .multilineTextAlignment(.center)
        }
    }
    var AICompleteView: some View {
        Group {
            Image("character_default")
            ZStack {
                Image("textBG_small")
                Text(characterObservable.customComplete ? "캐릭터 완성!" : "당신의 얼굴이\n캐릭터에 적용되었습니다!")
                    .multilineTextAlignment(.center)
                    .description()
            }
            Button {
                mainObservable.resetNavigation()
            } label: {
                RectangleView(width: 228, height: 65, text: "홈으로")
            }
            if characterObservable.customComplete {
                Button {
                    mainObservable.resetNavigation()
                    mainObservable.showFriendListFromMain = true
                } label: {
                    RectangleView(width: 228, height: 65, text: "친구 프로필 구경가기")
                }
            } else {
                NavigationLink {
                    CharacterCustomView()
                        .navigationBarBackButtonHidden()
                } label: {
                    RectangleView(width: 228, height: 65, text: "캐릭터 세부수정 하러가기")
                }
            }
        }
    }
}

struct CharacterAIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAIView()
    }
}
