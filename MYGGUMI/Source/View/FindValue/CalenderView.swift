//
//  CalenderView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct CalenderView: View {
    @State private var date = Date()
    @State private var missionObservable = MissionObservable.shared

    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                DatePicker(
                    "Start Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .applyTextColor(.white)
                .padding()
                HStack {
                    Spacer()
                    NavigationLink {
                        CompleteMissionView(completeText: "꾸미와의 일상공유를 통해\n$5 꾸미가 적립되었습니다!") {
                            missionObservable.missionList[2].isComplete = true
                            missionObservable.showShareLifeView = false
                        }
                    } label: {
                        RectangleView(width: 100, height: 40, text: "선택완료")
                    }
                }
                .padding(.horizontal, 25)
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
