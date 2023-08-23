//
//  ContentView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/16.
//

import SwiftUI

enum MainState {
    case login
    case onboarding
    case tutorial
}

struct ContentView: View {
    @State private var mainState: MainState = .login
    
    var body: some View {
        switch mainState {
        case .login:
            LoginView(mainState: $mainState)
        case .onboarding:
            OnboardingView(mainState: $mainState)
        case .tutorial:
            TutorialView(mainState: $mainState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
