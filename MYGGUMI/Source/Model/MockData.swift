//
//  MockData.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import Foundation


let schools = ["한국중학교", "한서 중학교", "한북 중학교", "한동글로벌학교"]
let grades = ["중1", "중2", "중3"]
let friends = [
    Friend("유한동", "010-11XX-22XX", "loginFriend1"),
    Friend("이한동", "010-33XX-44XX", "loginFriend2"),
    Friend("채한동", "010-55XX-66XX", "loginFriend3"),
    Friend("나한동", "010-77XX-88XX", "loginFriend4"),
]

struct Friend: Hashable {
    let id = UUID().uuidString
    var name: String
    var number: String
    var imageName: String
    init(name: String, number: String, imageName: String) {
        self.name = name
        self.number = number
        self.imageName = imageName
    }
    init(_ name: String,_ number: String,_ imageName: String) {
        self.name = name
        self.number = number
        self.imageName = imageName
    }
}
