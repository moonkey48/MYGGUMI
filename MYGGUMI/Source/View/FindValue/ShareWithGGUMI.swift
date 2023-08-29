//
//  ShareWithGGUMMI.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

struct ShareWithGGUMI: View {
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                VStack {
                    Text("10.25 Fri")
                        .description()
                        .padding(.bottom, 40)
                    HStack(spacing: 25) {
                        NavigationLink {
                            RecordWithPhotoView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            RectangleView(width: 130, height: 115, text: "사진으로\n기록")
                        }
                        NavigationLink {
                            RecordWithDiaryView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            RectangleView(width: 130, height: 115, text: "일기로\n기록")
                        }
                    }
                    .padding(.bottom, 10)
                    NavigationLink {
                        RecordWithAIView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        RectangleView(width: 285, height: 115, text: "AI꾸미로 기록")
                    }
                }
                .multilineTextAlignment(.center)
                Spacer()
                CustomTabView()
                
            }
        }
    }
}

struct ShareWithGGUMI_Previews: PreviewProvider {
    static var previews: some View {
        ShareWithGGUMI()
    }
}
