//
//  CompleteMissionView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct CompleteMissionView: View {
    @State var completeText = ""
    var comletionHander: () -> Void
    var body: some View {
        BackgroundView { geo in
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                comletionHander()
            }
        }
    }
}

struct CompleteMissionView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteMissionView(completeText: "친구 칭찬하기를 통해\n$5 꾸미가 적립되었습니다!") {
            
        }
    }
}
