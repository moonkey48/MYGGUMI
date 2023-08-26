//
//  FriendListView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import SwiftUI

struct DummyFriend: Hashable {
    let id = UUID().uuidString
    var name: String
    var tags: String
}

let dummyFriendList = [
    DummyFriend(name: "김꾸미", tags: "#도전 #창의성 #예술"),
    DummyFriend(name: "주꾸미", tags: "#기쁨 #보수 #노래잘함"),
    DummyFriend(name: "이가치", tags: "#행복 #즐거움 #예능"),
    DummyFriend(name: "고능력", tags: "#공학 #수학 #논리적"),
    DummyFriend(name: "박칭찬", tags: "#열정 #도전 #의지"),
    DummyFriend(name: "김우주", tags: "#안정 #규칙 #끈기")
]

struct FriendListView: View {
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                VStack(spacing: -25) {
                    ForEach(0..<dummyFriendList.count, id: \.self) { index in
                        NavigationLink {
                            FriendDetailView()
                        } label: {
                            HStack(spacing: 0) {
                                Image("profile\(index + 1)")
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(.white.opacity(0.1))
                                        .frame(width: 230, height: 60)
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 230, height: 60)
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text(dummyFriendList[index].name)
                                            Text(dummyFriendList[index].tags)
                                        }
                                        .description(.white, 15)
                                        Spacer()
                                        Image("chat_graphic")
                                    }
                                    .padding(.horizontal, 20)
                                    .frame(width: 230, height: 60)
                                }
                            }
                        }

                        
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
        
    }
}

struct FriendListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendListView()
    }
}
