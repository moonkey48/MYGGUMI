//
//  SwiftUIView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct Mission:Hashable {
    let id = UUID().uuidString
    var content: String
    var isComplete: Bool
}

struct MissionPage: View {
    @State var complimentTutorialCompleted = false
    @State private var missionList: [Mission] = [
        Mission(content: "친구 2명 칭찬하기", isComplete: false),
        Mission(content: "꾸미와 대화나누기", isComplete: false),
        Mission(content: "일상 공유하기", isComplete: false),
        Mission(content: "직업체험하기", isComplete: false),
    ]
     
    var body: some View {
        BackgroundView {
            VStack(spacing: 0) {
                HeaderView()
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Image("mission_textBG1")
                    Text("오늘의 미션")
                        .description(.white, 25)
                }
                .padding(.bottom, 90)
                VStack(spacing: 18) {
                    ForEach(missionList.indices, id: \.self) { index in
                        HStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(missionList[index].isComplete ? .white.opacity(1) : .white.opacity(0.1))
                                    .frame(width: 200, height: 36)
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .stroke(.white, lineWidth: 2)
                                    .frame(width: 200, height: 36)
                                Text(missionList[index].content)
                                    .lineSpacing(-10)
                                    .description(missionList[index].isComplete ? .purple : .white, 16)
                            }
                            Button {
                                missionList[index].isComplete.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(missionList[index].isComplete ? .white.opacity(1) : .white.opacity(0.1))
                                        .frame(width: 36, height: 36)
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 36, height: 36)
                                    if missionList[index].isComplete {
                                        Image("mission_done")
                                            .resizable()
                                            .frame(width: 36, height: 36)
                                    }
                                }
                            }

                        }
                    }
                }
                    
                
                Spacer()
                CustomTabView()
            }
            .padding(.horizontal,60)
            .onAppear {
                if complimentTutorialCompleted {
                    missionList[0].isComplete = true
                }
            }
        }
    }
}

struct MissionPage_Previews: PreviewProvider {
    static var previews: some View {
        MissionPage()
    }
}
