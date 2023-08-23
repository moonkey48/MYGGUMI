//
//  ComplimentCompleteView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct ComplimentCompleteView: View {
    var body: some View {
        NavigationStack {
            BackgroundView {
                NavigationLink {
                    MissionPage(complimentTutorialCompleted: true)
                        .navigationBarBackButtonHidden()
                } label: {
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
            }
        }
        .onAppear {
            BasicDataObservable.shared.coin += 5
        }
    }
}

struct ComplimentCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentCompleteView()
    }
}
