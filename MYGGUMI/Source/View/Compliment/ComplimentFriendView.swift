//
//  ComplimentFriendView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct ComplimentFriendView: View {
    @State private var changeFriend = true
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                toggleView
                topView
                Spacer()
                CustomTabView()
            }
        }
    }
}
extension ComplimentFriendView {
    var toggleView: some View {
        HStack {
            Spacer()
            Button {
                changeFriend.toggle()
            } label: {
                Image(changeFriend ? "mission_toggle_on" : "mission_toggle_off")
            }
        }
        .padding()
    }
    var topView: some View {
        VStack {
            Image(changeFriend ? "mission_profile_self" : "mission_profile_friend")
            Text(changeFriend ? "남을 가장 잘 챙겨주는 친구는?" : "유OO에게 가장 잘 어울리는 말은?")
                .description(.white, 16)
        }
    }
}

struct ComplimentFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentFriendView()
    }
}
