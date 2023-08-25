//
//  recordWithDiaryView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

struct RecordWithDiaryView: View {
    @State private var diaryText = ""
    
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                VStack(spacing: 40) {
                    HStack {
                        Spacer()
                        Text("10.07 Mon")
                            .description()
                        Spacer()
                    }
                    .frame(height: 40)
                    .background(.white.opacity(0.2))
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(.white.opacity(0.2))
                        VStack(alignment: .leading) {
                            TextField("", text: $diaryText, axis: .vertical)
                                .placeholder(when: diaryText.isEmpty) {
                                    HStack {
                                        Text("오늘 있었던 일을 작성해보세요! :)")
                                            .foregroundColor(.white)
                                        Spacer()
                                    }
                                }
                            
                            Spacer()
                            HStack {
                                Spacer()
                                NavigationLink {
                                    CalenderView()
                                } label: {
                                    RectangleView(width: 100, height: 40, text: "작성완료")
                                }
                            }
                        }
                        .padding(30)
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct RecordWithDiaryViewView_Previews: PreviewProvider {
    static var previews: some View {
        RecordWithDiaryView()
    }
}
