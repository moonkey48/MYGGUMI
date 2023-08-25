//
//  ComplimentSelfView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct ComplimentSelfView: View {
    @State private var complimentList: [Compliment] = complimentSampleList
    @State private var selectedCompliment: Compliment?
    
    let columns = [
            GridItem(.fixed(126), spacing: nil),
            GridItem(.fixed(126), spacing: nil)
        ]
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                
                Spacer()
                CustomTabView()
            }
            VStack {
                topView
                complimentListView
            }
        }
    }
}
extension ComplimentSelfView {
    var topView: some View {
        VStack {
            ZStack {
                Image("mission_profile_friend")
            }
            Text("나와 가장 잘 어울리는 말은?")
                .description(.white, 16)
        }
    }
    var complimentListView: some View {
        VStack {
            Spacer()
                .frame(height: 30)
            LazyVGrid(columns: columns) {
                ForEach(complimentList, id: \.id) { compliment in
                    Button {
                        selectedCompliment = compliment
                    } label: {
                        if selectedCompliment?.id == compliment.id {
                            RectangleView(width: 126, height: 50, text: compliment.text, backgroundColor: .white, foregroundColor: .black)
                        } else {
                            RectangleView(width: 126, height: 50, text: compliment.text)
                        }
                    }
                }
            }
            RectangleView(width: 262, height: 40, text: "직접쓰기")
                .padding(.top, 30)
            VStack {
                if let _ = selectedCompliment {
                    NavigationLink {
                        ComplimentCompleteView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        ZStack {
                            Image("mission_textBG2")
                            Text("칭찬 완료")
                        }
                        .foregroundColor(.white)
                    }
                } else {
                    Spacer()
                }
            }
            .frame(height: 50)
        }
        .frame(height: 300)
    }
}

struct ComplimentSelfView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentSelfView()
    }
}
