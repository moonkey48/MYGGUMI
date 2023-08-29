//
//  RecordWithAIView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

struct RecordWithAIView: View {
    @State private var isRecording = true
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                Spacer()
                if isRecording {
                    VStack(spacing: 70) {
                        Text("10.25 Fri")
                            .description()
                        Image("onboarding_intro")
                        Text("AI가 오늘 하루\n 기록 중입니다.")
                            .description()
                        Text("잠시만 기다려주세요")
                            .description()
                    }
                } else {
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            Text("10.07 Mon")
                                .description()
                            Spacer()
                        }
                        .frame(height: 40)
                        .background(.white.opacity(0.2))
                        .padding(.bottom, 30)
                        VStack(alignment: .leading, spacing: 10) {
                            Text("사진 고르기 (선택)")
                                .description()
                                .padding(.bottom, 20 )
                            HStack(spacing: 15) {
                                Image("imageSample1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 106)
                                    .cornerRadius(25)
                                Image("imageSample2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 106)
                                    .cornerRadius(25)
                                Spacer()
                            }
                            .padding(.bottom, 30)
                            Text("있었던 일")
                                .description()
                                .padding(.bottom, 30)
                            HStack {
                                Text("●")
                                    .font(.system(size: 7))
                                Text("디그리 보기")
                            }
                            HStack {
                                Text("●")
                                    .font(.system(size: 7))
                                Text("드라이브")
                            }
                            HStack {
                                Text("●")
                                    .font(.system(size: 7))
                                Text("약속")
                            }
                            HStack {
                                Spacer()
                                NavigationLink {
                                    CalenderView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    RectangleView(width: 100, height: 40, text: "선택 완료")
                                }
                            }
                        }
                        .padding()
                        .frame(width: geo.size.width)
                        .description()
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isRecording = false
            }
        }
    }
}

struct RecordWithAIView_Previews: PreviewProvider {
    static var previews: some View {
        RecordWithAIView()
    }
}
