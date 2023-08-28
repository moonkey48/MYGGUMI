//
//  SwiftUIView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI


struct ComplimentTutorialView: View {
    @ObservedObject private var missionObservable = MissionObservable.shared
     
    var body: some View {
        
        BackgroundView { geo in
            VStack(spacing: 0) {
                HeaderView()
                Spacer()
                    .frame(height: 50)
                ZStack {
                    Image("mission_textBG1")
                    Text("오늘의 미션")
                        .description(.white, 25)
                    Image("finger_down")
                        .offset(x: -100, y: 110)
                }
                .padding(.bottom, 90)
                VStack(spacing: 18) {
                    ForEach(missionObservable.missionList.indices, id: \.self) { index in
                        HStack {
                            if index == 0 {
                                NavigationLink {
                                    ComplimentFriendView()
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .fill(missionObservable.missionList[index].isComplete ? .white.opacity(1) : .white.opacity(0.1))
                                            .frame(width: 200, height: 36)
                                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                            .stroke(.white, lineWidth: 2)
                                            .frame(width: 200, height: 36)
                                        Text(missionObservable.missionList[index].content)
                                            .lineSpacing(-10)
                                            .description(missionObservable.missionList[index].isComplete ? .purple : .white, 16)
                                    }
                                }

                            } else {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(missionObservable.missionList[index].isComplete ? .white.opacity(1) : .white.opacity(0.1))
                                        .frame(width: 200, height: 36)
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 200, height: 36)
                                    Text(missionObservable.missionList[index].content)
                                        .lineSpacing(-10)
                                        .description(missionObservable.missionList[index].isComplete ? .purple : .white, 16)
                                }
                            }
                            Button {
                                missionObservable.missionList[index].isComplete.toggle()
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .fill(missionObservable.missionList[index].isComplete ? .white.opacity(1) : .white.opacity(0.1))
                                        .frame(width: 36, height: 36)
                                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                                        .stroke(.white, lineWidth: 2)
                                        .frame(width: 36, height: 36)
                                    if missionObservable.missionList[index].isComplete {
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
        }
        
        
    }
}

struct ComplimentTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentTutorialView()
    }
}
