//
//  TutorialView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/21.
//

import SwiftUI

enum TutorialState: CaseIterable {
    case intro
    case findValueButton
    case findValue1
    case findValue2
    case praiseButton
    case praise1
    case dreamButton
    case dream1
    case dream2
    case shareButton
    case share1
    case missionButton
    case mission1
}

struct TutorialView: View {
    let tutorialStateList = TutorialState.allCases
    @State private var tutorialStateIndex = 0
    @State private var tutorialState: TutorialState = .intro
    
    var body: some View {
        BackgroundView {
            VStack(spacing: 0) {
                Header
                TopSection
                // MARK: Modal
                
                HStack(spacing: 10) {
                    switch tutorialState {
                    case .praiseButton:
                        ComplimentModalOnFocused
                    default:
                        ComplimentModal
                    }
                    switch tutorialState {
                    case .findValueButton:
                        ValueModalOnFocused
                    default:
                        ValueModal
                    }
                }
                .padding(.bottom, 10)
                
                // MARK: MainModal
                MainModal
                Spacer()
                // MARK: Footer
                CustomTabView
            }
            .padding(.horizontal,60)
            
            // MARK: handle state
            switch tutorialState {
            case .intro:
                IntroStateView
            case .findValue1:
                FindValue1View
            case .findValue2:
                FindValue2View
            case .praise1:
                Praise1View
            default:
                EmptyView()
            }
        }
    }
}

// MARK: 기본 뷰
extension TutorialView {
    var Header: some View {
        HStack(spacing: 0) {
            Spacer()
            Image("main_coin")
                .padding(.trailing, 10)
            Text("0")
                .description()
        }
        .padding([.bottom, .horizontal], 20)
    }
    
    var TopSection: some View {
        Group {
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
        }
    }
    
    var ComplimentModal: some View {
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
    }
    
    var ValueModal: some View {
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
    
    var MainModal: some View {
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
    
    var CustomTabView: some View {
        HStack(spacing: -10) {
            Image("icon_tab1")
            Image("icon_tab2")
            Image("icon_tab3")
            Image("icon_tab4")
            Image("icon_tab5")
        }
    }
}

// MARK: State 관련 View
extension TutorialView {
    // Intro
    var IntroStateView: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                Image("character_basic")
                    .padding(.bottom, 20)
                Text("이곳이 여러분의 메인페이지에요!")
                    .description()
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
    
    // valueButton
    var ValueModalOnFocused: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white.opacity(0.1))
                .frame(width: 135, height: 135)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(.white, lineWidth: 5)
                .frame(width: 135, height: 135)
            Text("가치\n찾기")
                .lineSpacing(-10)
                .description()
            Image("finger_down_point")
                .offset(y: -90)
        }
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
    
    // value1
    var FindValue1View: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                ZStack {
                    Image("character_findValue1")
                        .offset(x: -140)
                    Image("finger_down")
                        .offset(x: 70, y: -10)
                }
                Text("‘저와의 대화’와 ‘일상공유’를 통해\n여러분이 무엇을 중요하게\n생각하는지 알 수 있어요!")
                    .description()
                    .multilineTextAlignment(.center)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
    
    // findValue2
    var FindValue2View: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                ZStack {
                    Image("character_cooker")
                        .offset(x: -140)
                    Image("finger_down")
                        .offset(x: 70, y: -10)
                }
                Text("이곳에서 가치에 따른\n나만의 캐릭터도 확인해보세요!")
                    .description()
                    .multilineTextAlignment(.center)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
    
    // compliment
    var ComplimentModalOnFocused: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.white.opacity(0.1))
                .frame(width: 135, height: 135)
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .stroke(.white, lineWidth: 5)
                .frame(width: 135, height: 135)
            Text("칭찬\n하기")
                .lineSpacing(-10)
                .description()
            Image("finger_up")
                .offset(x: -10,y: 80)
        }
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
    
    // findValue2
    var Praise1View: some View {
        ZStack {
            Color.black.opacity(0.5)
            VStack {
                Text("또, 친구들과의 칭찬을 통해 여러분이\n무엇을 잘하는지 확인해보세요!")
                    .description()
                    .multilineTextAlignment(.center)
                ZStack {
                    Image("finger_top_bling")
                        .offset(x: -70, y: 80)
                    Image("character_rough")
                        .offset(x: 140)
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            tutorialState = tutorialStateList[tutorialStateIndex + 1]
            tutorialStateIndex += 1
        }
    }
}


struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
