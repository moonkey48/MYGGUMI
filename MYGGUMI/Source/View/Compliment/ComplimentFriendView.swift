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
}

struct ComplimentFriendView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentFriendView()
    }
}
