//
//  CharacterObservable.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/26.
//

import Foundation

final class CharacterObservable: ObservableObject {
    static let shared = CharacterObservable()
    private init() {}
    
    @Published var customComplete = false
}
