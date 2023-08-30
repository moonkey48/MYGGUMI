//
//  MainObservable.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import Foundation

final class MainObservable: ObservableObject {
    static let shared = MainObservable()
    private init() {}
    
    @Published var showComplimentFromMain = false
    @Published var showFindValueFromMain = false
    
    @Published var showMissionFromMain = false
    @Published var showSpaceFromMain = false
    @Published var showChatFromMain = false
    @Published var showFriendListFromMain = false
    
    
    func resetNavigation(){
        showComplimentFromMain = false
        showFindValueFromMain = false
        showMissionFromMain = false
        showSpaceFromMain = false
        showChatFromMain = false
        showFriendListFromMain = false
    }
}
