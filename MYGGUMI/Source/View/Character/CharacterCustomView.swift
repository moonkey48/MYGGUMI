//
//  CharacterCustomView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

enum CustomOptions: String {
    case face = "표정"
    case star = "별"
    case cloth = "옷"
}

struct CharacterCustomView: View {
    @State private var customOptions: CustomOptions = .face
    
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                ZStack {
                    CharacterImageView
                    VStack(spacing: 0) {
                        Spacer()
                        OptionButtonView
                        ZStack {
                            BackdropBlurView(radius: 4)
                                .frame(width: UIScreen.main.bounds.width - 7, height: 300)
                            RectangleView(width: UIScreen.main.bounds.width - 4, height: 300, text: "", backgroundColor: .black.opacity(0.3))
                        }
                        
                        Button {
                            
                        } label: {
                            Text("완료")
                                .description()
                                .padding(.vertical, 20)
                        }
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}
extension CharacterCustomView {
    var CharacterImageView: some View {
        VStack {
            Image("fullMid_default_yellowStar_basic")
        }
    }
    
    var OptionButtonView: some View {
        HStack(alignment: .bottom) {
            Button {
                customOptions = .face
            } label: {
                CustomRectangleView(customOption: $customOptions)
            }
            Button {
                customOptions = .star
            } label: {
                CustomRectangleView(customOption: $customOptions,text: "별")
            }
            Button {
                customOptions = .cloth
            } label: {
                CustomRectangleView(customOption: $customOptions,text: "옷")
            }
            Spacer()
        }
        .padding(.horizontal,30)
    }
}

struct CustomRectangleView: View {
    @Binding var customOption: CustomOptions
    @State var text = "표정"
    @State private var height:CGFloat = 28
    var body: some View {
        ZStack {
            VStack{}
            .frame(width: 65, height: height)
            .background(.white.opacity(0.1))
            .cornerRadius(8, corners: [.topLeft, .topRight])
            VStack{
                
            }
            .frame(width: 65, height: height)
            .background(.white.opacity(0.3))
            .cornerRadius(8, corners: [.topLeft, .topRight])
            Text(text)
                .description()
        }
        .onAppear {
            if customOption.rawValue == text {
                withAnimation(.easeIn(duration: 0.2)) {
                    height = 40
                }
            } else {
                withAnimation(.easeIn(duration: 0.2)) {
                    height = 28
                }
            }
        }
        .onChange(of: customOption) { newValue in
            if newValue.rawValue == text {
                withAnimation(.easeIn(duration: 0.2)) {
                    height = 40
                }
            } else {
                withAnimation(.easeIn(duration: 0.2)) {
                    height = 28
                }
            }
        }
    }
}

struct CharacterCustomView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCustomView()
    }
}
