//
//  ChatWithGGUMMI.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

enum ChatState: CaseIterable {
    case textNotSubmited
    case textSubmited
    case showValue
    case navigationToHomeOrCharacter
}

struct ChatWithGGUMI: View {
    enum Field {
        case chat
      }
    let chatStateList = ChatState.allCases
    @FocusState private var focusField: Field?
    @State private var chatStateIndex = 0
    @State private var currentChatState: ChatState = .textNotSubmited
    @State private var currentText = ""
    @State private var submitedText = ""
    var body: some View {
        BackgroundView {
            Group {
                switch currentChatState {
                case .textNotSubmited:
                    VStack {
                        Spacer()
                            .frame(height: 30)
                        VStack {
                            HStack{
                                Spacer()
                            }
                            Spacer()
                        }
                        .background(.white.opacity(0.1))
                        .cornerRadius(30)
                    }
                default:
                    EmptyView()
                }
                VStack(spacing: 0){
                    HeaderView()
                    switch currentChatState {
                    case .textNotSubmited:
                        ChatView
                    case .textSubmited:
                        TextSubmitedView
                    case .showValue:
                        ShowValueView
                    case .navigationToHomeOrCharacter:
                        NavigationToHomeOrCharacterView
                    }
                }
            }
            .onAppear {
                focusField = .chat
            }
            .onChange(of: submitedText) { newValue in
                if !newValue.isEmpty {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        currentChatState = chatStateList[chatStateIndex + 1]
                        chatStateIndex += 1
                    }
                }
            }
        }
    }
}
extension ChatWithGGUMI {
    var ChatView: some View {
        Group {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 10)
                Image("chat_ggumi_profile")
                Group {
                    Text("가장 존경하는 인물이 누구야?")
                }
                .frame(width: 262, height: 32)
                .background(Color(.lightGray))
                .cornerRadius(10)
                Spacer()
            }
            HStack(spacing: 0) {
                Spacer()
                Group {
                    Text("나는 앤디 워홀을 가장 존경해")
                }
                .frame(width: 262, height: 32)
                .background(Color(.lightGray))
                .cornerRadius(10)
                
                Spacer()
                    .frame(width: 10)
            }
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: 10)
                Image("chat_ggumi_profile")
                Group {
                    Text("그분을 존경하는 이유가 뭐야?")
                }
                .frame(width: 262, height: 32)
                .background(Color(.lightGray))
                .cornerRadius(10)
                Spacer()
            }
            if !submitedText.isEmpty {
                HStack(spacing: 0) {
                    Spacer()
                    Group {
                        Text(submitedText)
                    }
                    .frame(width: 262, height: 32)
                    .background(Color(.lightGray))
                    .cornerRadius(10)
                    
                    Spacer()
                        .frame(width: 10)
                }
            }
            Spacer()
            HStack(spacing: 0) {
                TextField(text: $currentText) {
                    Text("")
                }
                .focused($focusField, equals: .chat)
                .onSubmit {
                    submitedText = currentText
                    currentText = ""
                }
            }
            .frame(width: .infinity, height: 20)
            .padding(.horizontal, 20)
            .background(.white)
        }
    }
    var TextSubmitedView: some View {
        VStack {
            Spacer()
            VStack {
                Image("mission_complete")
                    .padding(.bottom,20)
                Text("꾸미와의 채팅을 통해\n$5 꾸미가 적립되었습니다!")
                    .description()
                    .multilineTextAlignment(.center)
                Spacer()
            }
            .frame(height: 300)
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                currentChatState = chatStateList[chatStateIndex + 1]
                chatStateIndex += 1
            }
        }
    }
    var ShowValueView: some View {
        VStack {
            Spacer()
            VStack {
                Image("mission_complete")
                    .padding(.bottom,20)
                HStack {
                    Text("#즐거움")
                        .description()
                    Text("#도전성")
                        .description()
                    Text("#자기계발")
                        .description()
                }
                Spacer()
            }
            .frame(height: 300)
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                currentChatState = chatStateList[chatStateIndex + 1]
                chatStateIndex += 1
            }
        }
    }
    var NavigationToHomeOrCharacterView: some View {
        VStack {
            Spacer()
            VStack {
                Image("mission_complete")
                    .padding(.bottom,20)
                VStack {
                    Button {
                        // TODO: Navigation to Home
                    } label: {
                        RectangleView(width: 170, height: 48, text: "홈으로")
                    }
                    Button {
                        // TODO: Navigation To Character
                    } label: {
                        RectangleView(width: 170, height: 48, text: "나만의 캐릭터 꾸미기")
                    }
                }
                Spacer()
            }
            .frame(height: 300)
            Spacer()
        }
    }
}

struct ChatWithGGUMI_Previews: PreviewProvider {
    static var previews: some View {
        ChatWithGGUMI()
    }
}
