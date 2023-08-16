//
//  LoginView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

enum LoginState {
    case intro
    case start
    case name
    case school
    case friends
}

struct LoginView: View {
    @State private var name = ""
    @State private var transitionOpacity: Double = 0
    @State private var loginState: LoginState = .start
    var body: some View {
        BackgroundView {
            VStack {
                Spacer()
                Group {
                    switch loginState {
                    case .intro:
                        EmptyView()
                    case .start:
                        WelcomeView
                    case .name:
                        NameView
                    case .school:
                        NameView
                    case .friends:
                        NameView
                    }
                    
                }
                .opacity(transitionOpacity)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("다음")
                            .description(.white, 23)
                    }
                    .padding(.trailing, 80)
                }
                Spacer()
                    .frame(height: 140)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                opacityTransition(.start)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                opacityTransition(.name)
            }
        }
    }
    private func opacityTransition(_ changeTo:LoginState){
        withAnimation(.easeInOut(duration: 0.3)){
            transitionOpacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            loginState = changeTo
        }
        withAnimation(.easeInOut(duration: 0.3).delay(0.1)){
            transitionOpacity = 1
        }
    }
}
extension LoginView {
    
    private var WelcomeView: some View {
        VStack {
            Image("loginWelcome")
                .resizable()
                .scaledToFit()
                .frame(width: 146, height: 72)
                .padding(.bottom, 35)
            Text("환영합니다!")
                .description(.white, 17)
        }
    }
    private var NameView: some View {
        VStack {
            Text("이름")
                .description(.white, 23)
                .padding(.bottom, 23)
            VStack {
                TextField(text: $name) {
                    Text("실제 이름을 입력해주세요")
                        .foregroundColor(Color(.white))
                }
                .padding(10)
                .background(Color(.white).opacity(0.5))
                .frame(width: 204, height: 30)
                .cornerRadius(8)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
