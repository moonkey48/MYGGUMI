//
//  BasicDataObservable.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import Foundation

final class BasicDataObservable: ObservableObject {
    static let shared = BasicDataObservable()
    private init() {}
    
    @Published var name = ""
    @Published var selectedFriends:[String] = []
    @Published var school = ""
    @Published var age = ""
    @Published var coin = 0
}
