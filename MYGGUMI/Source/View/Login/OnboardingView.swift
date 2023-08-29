//
//  OnboardingView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/21.
//

import SwiftUI

enum OnboardingState:CaseIterable {
    case intro
    case loading
    case description1
    case description2
    case description3
}

struct OnboardingView: View {
    @Binding var mainState: MainState
    let onboardingStateList = OnboardingState.allCases
    @State private var onboardingState: OnboardingState = .intro
    @State private var onboardingStateIndex = 0
    
    
    var body: some View {
        BackgroundView { geo in
            VStack(spacing: 0){
                Spacer()
                switch onboardingState {
                case .intro:
                    IntroView
                case .loading:
                    LoadingView
                case .description1:
                    DescriptionView1
                        .transition(.opacity)
                case .description2:
                    DescriptionView2
                        .transition(.opacity)
                case .description3:
                    DescriptionView3
                        .transition(.opacity)
                }
                Spacer()
                // 다음버튼
                HStack {
                    Spacer()
                    Button {
                        if onboardingStateIndex < onboardingStateList.count - 1 {
                            onboardingState = onboardingStateList[onboardingStateIndex + 1]
                            onboardingStateIndex += 1
                        } else {
                            mainState = .tutorial
                        }
                    } label: {
                        Text("다음")
                            .normalDescription(.white, 23)
                    }
                    .padding(.trailing, 70)
                }
                .frame(width: geo.size.width)
                Spacer()
                    .frame(height: 40)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                onboardingState = onboardingStateList[onboardingStateIndex + 1]
                onboardingStateIndex += 1
            }
        }
    }
}

extension OnboardingView {
    private var IntroView: some View {
        VStack {
            Image("onboarding_intro")
                .padding(.bottom, 28)
            Text("가입완료!")
                .normalDescription(.white, 17)
                .padding(.bottom, 55)
            Text("마이꾸미에서\n당신의 꿈을 찾으세요!")
                .normalDescription(.white, 15)
                .multilineTextAlignment(.center)
        }
    }
    private var LoadingView: some View {
        VStack {
            Image("onboardingStar")
        }
    }
    private var DescriptionView1: some View {
        VStack {
            Image("character_basic")
                .padding(.bottom, 20)
            Text("안녕하세요! 저는 꾸미라고 합니다!\n마이꾸미에 대해\n간단하게 소개해 드릴게요")
                .normalDescription(.white, 15)
            .multilineTextAlignment(.center)
        }
    }
    private var DescriptionView2: some View {
        VStack {
            Image("character_basic")
                .padding(.bottom, 20)
            Text("사실 꿈이란, 단순한 직업이 아닌\n인생의 목표를 의미해요!")
                .normalDescription(.white, 15)
            .multilineTextAlignment(.center)
        }
    }
    private var DescriptionView3: some View {
        VStack {
            Image("character_basic")
                .padding(.bottom, 20)
            Text("여러분의 꿈은 여러분의\n능력과 가치를\n통해 만들어진답니다")
                .normalDescription(.white, 15)
                .multilineTextAlignment(.center)
        }
    }
}

private struct OnboardingPreview: View {
    @State private var mainState: MainState = .login
    var body: some View {
        OnboardingView(mainState: $mainState)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPreview()
    }
}
