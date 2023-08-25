//
//  FindValueObservable.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import Foundation

final class MissionObservable: ObservableObject {
    static let shared = MissionObservable()
    private init() {}
    
    @Published var missionList: [Mission] = [
        Mission(content: "친구 2명 칭찬하기", isComplete: false),
        Mission(content: "꾸미와 대화나누기", isComplete: false),
        Mission(content: "일상 공유하기", isComplete: false),
        Mission(content: "직업체험하기", isComplete: false)
    ]
    
    @Published var showComplementView = false
    @Published var showTalkView = false
    @Published var showShareLifeView = false
    @Published var showExperienceJobView = false
}
