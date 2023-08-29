//
//  ComplimentFriendView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

enum ComplimentState: CaseIterable {
    case select1
    case togglePoint
    case toggleDescription
    case toggleEnd
    case select2
    case completeCompliment
}

struct Compliment {
    let id = UUID().uuidString
    var text: String
}
let complimentSampleList = [
    Compliment(text: "#청소왕"),
    Compliment(text: "#노래를 잘해"),
    Compliment(text: "#친절해"),
    Compliment(text: "#수학천재")
]

struct ComplimentFriendView: View {
    @State private var changeFriend = true
    @State private var friendList: [Friend] = friends
    @State private var complimentList: [Compliment] = complimentSampleList
    @State private var selected1Friend: Friend?
    @State private var selected2Compliment: Compliment?
    @State private var complimentState: ComplimentState = .select1
    let complimentStateList = ComplimentState.allCases
    @State private var complimentStateIndex = 0
    
    let columns = [
            GridItem(.fixed(126), spacing: nil),
            GridItem(.fixed(126), spacing: nil)
        ]
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                toggleView
                    .frame(width: geo.size.width)
                Spacer()
                CustomTabView()
            }
            VStack {
                topView
                if changeFriend {
                    complimentList1
                } else {
                    complimentList2
                }
            }
            switch complimentState {
            case .toggleDescription:
                ToggleDescriptionView
            default:
                EmptyView()
            }
        }
    }
}
extension ComplimentFriendView {
    var toggleView: some View {
        HStack {
            Spacer()
            Button {
                switch complimentState {
                case .togglePoint:
                    complimentState = complimentStateList[complimentStateIndex + 1]
                    complimentStateIndex += 1
                case .toggleEnd:
                    changeFriend.toggle()
                    complimentState = complimentStateList[complimentStateIndex + 1]
                    complimentStateIndex += 1
                default:
                    changeFriend.toggle()
                }
            } label: {
                Image(changeFriend ? "mission_toggle_on" : "mission_toggle_off")
            }
        }
        .padding()
    }
    var topView: some View {
        VStack {
            ZStack {
                Image(changeFriend ? "mission_profile_self" : "mission_profile_friend")
                switch complimentState {
                case .togglePoint:
                    Image("finger_up")
                        .offset(x: 150,y:-70)
                default:
                    EmptyView()
                }
            }
            Text(changeFriend ? "남을 가장 잘 챙겨주는 친구는?" : "유OO에게 가장 잘 어울리는 말은?")
                .description(.white, 16)
        }
    }
    var complimentList1: some View {
        VStack {
            LazyVGrid(columns: columns) {
                ForEach(friendList, id: \.id) { friend in
                    Button {
                        selected1Friend = friend
                    } label: {
                        
                        if selected1Friend?.id == friend.id {
                            RectangleView(width: 126, height: 76, text: friend.name, backgroundColor: .white, foregroundColor: .black)
                        } else {
                            RectangleView(width: 126, height: 76, text: friend.name)
                        }
                    }
                }
            }
            VStack {
                if let _ = selected1Friend {
                    Button {
                        complimentState = complimentStateList[complimentStateIndex + 1]
                        complimentStateIndex += 1
                    } label: {
                        ZStack {
                            Image("mission_textBG2")
                            Text("칭찬 완료")
                        }
                        .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 50)
        }
        .frame(height: 300)
    }
    var complimentList2: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            LazyVGrid(columns: columns) {
                ForEach(complimentList, id: \.id) { compliment in
                    Button {
                        selected2Compliment = compliment
                    } label: {
                        if selected2Compliment?.id == compliment.id {
                            RectangleView(width: 126, height: 50, text: compliment.text, backgroundColor: .white, foregroundColor: .black)
                        } else {
                            RectangleView(width: 126, height: 50, text: compliment.text)
                        }
                    }
                }
            }
            RectangleView(width: 262, height: 40, text: "직접쓰기")
                .padding(.top, 30)
            VStack {
                if let _ = selected2Compliment {
                    NavigationLink {
                        ComplimentCompleteView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        ZStack {
                            Image("mission_textBG2")
                            Text("칭찬 완료")
                        }
                        .foregroundColor(.white)
                    }
                } else {
                    Spacer()
                }
            }
            .frame(height: 50)
        }
        .frame(height: 300)
    }
    var ToggleDescriptionView: some View {
        ZStack {
            Color.black.opacity(0.8)
            HStack {
                Image("character_findValue1")
                    .offset(x: -60)
                VStack {
                    Image("finger_up")
                        .offset(x: 50,y:-180)
                    Text("여기를 누르면,\n원하는 친구에게\n칭찬을 할 수 있어요!")
                        .description()
                        .multilineTextAlignment(.center)
                        .offset(y:-50)
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            complimentState = complimentStateList[complimentStateIndex + 1]
            complimentStateIndex += 1
        }
    }
}

struct ComplimentFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentFriendView()
    }
}
