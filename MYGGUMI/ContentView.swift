//
//  ContentView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI



struct ContentView: View {
    @StateObject private var tutorialStateObservable = TutorialStateObservable.shared
    
    var body: some View {
        switch tutorialStateObservable.mainState {
        case .login:
            LoginView(mainState: $tutorialStateObservable.mainState)
        case .onboarding:
            OnboardingView(mainState: $tutorialStateObservable.mainState)
        case .tutorial:
            TutorialView(mainState: $tutorialStateObservable.mainState)
        case .complimentTutorial:
            TutorialView(mainState: $tutorialStateObservable.mainState)
        case .tutorialEnded:
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
