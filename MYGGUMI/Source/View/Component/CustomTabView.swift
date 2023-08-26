//
//  CustomTabView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct CustomTabView: View {
    @ObservedObject private var mainObservable = MainObservable.shared
    var body: some View {
        HStack(spacing: -10) {
            
            Button {
                mainObservable.showMissionFromMain = true
            } label: {
                Image("icon_tab1")
            }
            Button {
                mainObservable.showSpaceFromMain = true
            } label: {
                Image("icon_tab2")
            }
            Button {
                mainObservable.showComplimentFromMain = false
                mainObservable.showFindValueFromMain = false
                mainObservable.showMissionFromMain = false
                mainObservable.showSpaceFromMain = false
                mainObservable.showChatFromMain = false
                mainObservable.showFriendListFromMain = false
            } label: {
                Image("icon_tab3")
            }
            Button {
                mainObservable.showChatFromMain = true
            } label: {
                Image("icon_tab4")
            }
            Button {
                mainObservable.showFriendListFromMain = true
            } label: {
                Image("icon_tab5")
            }
        }
    }
}
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
