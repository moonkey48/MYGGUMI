//
//  ComplimentCompleteView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct ComplimentCompleteView: View {
    @ObservedObject private var missionObservable = MissionObservable.shared
    @ObservedObject private var mainObservable = MainObservable.shared
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                Image("mission_complete")
                    .padding(.bottom, 20)
                Text("친구 칭찬하기를 통해\n$5 꾸미가 적립되었습니다!")
                    .description()
                    .multilineTextAlignment(.center)
                Spacer()
                CustomTabView()
            }
        }
        .onAppear {
            BasicDataObservable.shared.coin += 5
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                missionObservable.missionList[0].isComplete = true
                missionObservable.showComplimentView = false
                if mainObservable.showComplimentFromMain {
                    mainObservable.showComplimentFromMain = false
                }
            }
        }
    }
}

struct ComplimentCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentCompleteView()
    }
}
