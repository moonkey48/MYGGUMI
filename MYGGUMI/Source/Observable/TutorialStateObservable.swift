//
//  TutorialStateObservable.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/28.
//

import Foundation

enum MainState {
    case login
    case onboarding
    case tutorial
    case complimentTutorial
    case tutorialEnded
}

final class TutorialStateObservable: ObservableObject {
    static let shared = TutorialStateObservable()
    private init() {}
    
    @Published var mainState: MainState = .login
}
