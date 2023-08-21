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
struct Friend {
    let id = UUID().uuidString
    var name: String
    var number: String
    var imageName: String
    init(name: String, number: String, imageName: String) {
        self.name = name
        self.number = number
        self.imageName = imageName
    }
    init(_ name: String,_ number: String,_ imageName: String) {
        self.name = name
        self.number = number
        self.imageName = imageName
    }
}

let schools = ["한국중학교", "한서 중학교", "한북 중학교", "한동글로벌학교"]
let grades = ["중1", "중2", "중3"]
let friends = [
    Friend("유한동", "010-11XX-22XX", "loginFriend1"),
    Friend("유한동", "010-33XX-44XX", "loginFriend2"),
    Friend("유한동", "010-55XX-66XX", "loginFriend3"),
    Friend("유한동", "010-77XX-88XX", "loginFriend4"),
]

struct LoginView: View {
    @State private var name = ""
    @State private var selectedSchool = ""
    @State private var selectedGrade = ""
    @State private var selectedFriends: [Friend] = []
    @State private var transitionOpacity: Double = 1
    @State private var loginState: LoginState = .intro
    @State private var alertText = ""
    
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
                        SchoolView
                    case .friends:
                        AddFriendsView
                    }
                }
                .opacity(transitionOpacity)
                if !alertText.isEmpty {
                    Text(alertText)
                        .frame(height: 70)
                        .foregroundColor(.white)
                } else {
                    Spacer()
                        .frame(height: 70)
                }
                Spacer()
                // 다음버튼
                HStack {
                    Spacer()
                    switch loginState {
                    case .intro:
                        EmptyView()
                    default:
                        Button {
                            alertText = ""
                            switch loginState {
                            case .name:
                                if name.isEmpty {
                                    alertText = "아직 이름이 입력되지 않았습니다!"
                                } else {
                                    print(name)
                                    loginState = .school
                                }
                            case .school:
                                if selectedSchool.isEmpty || selectedGrade.isEmpty {
                                    alertText = "아직 선택이 되지 않았습니다!"
                                } else {
                                    print(name)
                                    loginState = .friends
                                }
                            case .friends:
                                if selectedFriends.isEmpty {
                                    alertText = "아직 친구를 추가하지 않았습니다!"
                                } else {
                                    
                                }
                            default:
                                return
                            }
                            
                        } label: {
                            Text("다음")
                                .description(.white, 23)
                        }
                        .padding(.trailing, 80)
                    }
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
    private func opacityTransition(_ changeTo: LoginState){
        withAnimation(.easeInOut(duration: 0.3)){
            transitionOpacity = 0
        }
        loginState = changeTo
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//            loginState = changeTo
//        }
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
    
    private var SchoolView: some View {
        VStack {
            Text("학교, 학년")
                .description(.white, 23)
                .padding(.bottom, 23)
            HStack {
                Picker("학교", selection: $selectedSchool) {
                    ForEach(schools, id: \.self) {
                        Text($0)
                    }
                }
                Picker("학년", selection: $selectedGrade) {
                    ForEach(grades, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
    
    private var AddFriendsView: some View {
        VStack {
            Text("친구 추가")
                .description(.white, 23)
                .padding(.bottom, 23)
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(.white, lineWidth: 2)
                    .foregroundColor(.white.opacity(0))
                    .frame(width: 204, height: 204)
                VStack(alignment: .leading, spacing: -15){
                    ForEach(friends, id: \.id) { friend in
                        HStack(spacing: -5) {
                            Image("\(friend.imageName)")
                            VStack(alignment: .leading, spacing: 2) {
                                Text(friend.name)
                                    .description(.white, 15)
                                Text(friend.number)
                                    .description(.white, 11)
                            }
                            Spacer()
                            Button {
                                if selectedFriends.contains(where: { $0.id == friend.id }) {
                                    let deleteIndex = selectedFriends.firstIndex(where: { $0.id == friend.id}) ?? -1
                                    if deleteIndex != -1 {
                                        self.selectedFriends.remove(at: selectedFriends.firstIndex(where: { $0.id == friend.id}) ?? 0)
                                    }
                                } else {
                                    self.selectedFriends.append(friend)
                                }
                            } label: {
                                if selectedFriends.contains(where: { $0.id == friend.id }) {
                                    Image("loginSelected")
                                } else {
                                    Image("loginPlus")
                                }
                                
                            }
                        }
                    }
                }
                .padding(.trailing, 15)
            }
            .frame(width: 204, height: 204)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
