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
    @ObservedObject private var missionObservable = MissionObservable.shared
     
    var body: some View {
        NavigationStack {
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
                        ForEach(missionObservable.missionList.indices, id: \.self) { index in
                            HStack {
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
                                .onTapGesture {
                                    print(index)
                                    handleNavigation(index)
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
                .onAppear {
                    if complimentTutorialCompleted {
                        missionObservable.missionList[0].isComplete = true
                    }
                }
            }
            .navigationDestination(isPresented: $missionObservable.showComplementView) {
                ComplimentMainView()
            }
            .navigationDestination(isPresented: $missionObservable.showTalkView) {
                ChatWithGGUMI()
            }
            .navigationDestination(isPresented: $missionObservable.showShareLifeView) {
                FindValueMainView()
            }
            .navigationDestination(isPresented: $missionObservable.showExperienceJobView) {
                JobSpaceView()
            }
        }
    }
    
    private func handleNavigation(_ index: Int) {
        if index == 0 {
            missionObservable.showComplementView = true
        } else if index == 1 {
            missionObservable.showTalkView = true
        } else if index == 2 {
            missionObservable.showShareLifeView = true
        } else {
            missionObservable.showExperienceJobView = true
        }
    }
}

struct MissionPage_Previews: PreviewProvider {
    static var previews: some View {
        MissionPage()
    }
}
