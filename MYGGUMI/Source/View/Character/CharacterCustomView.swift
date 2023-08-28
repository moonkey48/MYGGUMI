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
let faceList = [
    "face1","face2","face3","face4","face5","face6",
]
let starList = [
    "star1","star2","star3","star4","star5","star6",
]
let clothList = [
    "cloth1","cloth2","cloth3","cloth4","cloth5","cloth6",
]

struct CharacterCustomView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var characterObservable = CharacterObservable.shared
    @State private var customOptions: CustomOptions = .face
    @State private var selectedFace = ""
    @State private var selectedStar = ""
    @State private var selectedCloth = ""
    let columns = [
            GridItem(.fixed(120), spacing: nil),
            GridItem(.fixed(120), spacing: nil),
            GridItem(.fixed(120), spacing: nil)
        ]
    
    var body: some View {
        BackgroundView { geo in
            CharacterImageView
            VStack {
                HeaderView()
                Spacer()
                
                VStack(spacing: 0) {
                    Spacer()
                    OptionButtonView
                    ZStack {
                        BackdropBlurView(radius: 4)
                            .frame(width: UIScreen.main.bounds.width - 7, height: 300)
                        RectangleView(width: UIScreen.main.bounds.width - 4, height: 300, text: "", backgroundColor: .black.opacity(0.3))
                        switch customOptions {
                        case .face:
                            FaceListView
                        case .star:
                            StarListView
                        case .cloth:
                            ClothListView
                        }
                        
                    }
                    
                    Button {
                        characterObservable.customComplete = true
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("완료")
                            .description()
                            .padding(.top, 20)
                    }
                }
                CustomTabView()
            }
        }
    }
}
extension CharacterCustomView {
    var CharacterImageView: some View {
        VStack {
            switch customOptions {
            case .face:
                if selectedFace.isEmpty {
                    Image("fullMid_default_yellowStar_basic")
                } else {
                    Image("fullMid_default_yellowStar")
                }
            case .star:
                if selectedStar.isEmpty {
                    Image("fullBig_default_yellowStar")
                        .offset(y: 200)
                } else {
                    Image("fullBig_default_pinkStar")
                        .offset(y: 200)
                }
            case .cloth:
                if selectedCloth.isEmpty {
                    Image("fullSmall_default_pinkStar")
                        .offset(y: -150)
                } else {
                    Image("fullSmall_space_pinkStar")
                        .offset(y: -150)
                }
            }
        }
        .offset(y: -100)
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
    
    var FaceListView: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(faceList, id: \.self) { face in
                ZStack {
                    Button {
                        selectedFace = face
                    } label: {
                        ZStack {
                            if selectedFace == face {
                                Image("selectedBG")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                            }
                            Image(face)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
        }
    }
    var StarListView: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(starList, id: \.self) { star in
                ZStack {
                    Button {
                        selectedStar = star
                    } label: {
                        ZStack {
                            if selectedStar == star {
                                Image("selectedBG")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                            }
                            Image(star)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
        }
    }
    var ClothListView: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(clothList, id: \.self) { cloth in
                ZStack {
                    Button {
                        selectedCloth = cloth
                    } label: {
                        ZStack {
                            if selectedCloth == cloth {
                                Image("selectedBG")
                                    .resizable()
                                    .frame(width: 120, height: 100)
                            }
                            Image(cloth)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
        }
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
