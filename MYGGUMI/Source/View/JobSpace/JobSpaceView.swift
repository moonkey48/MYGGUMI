//
//  JobSpaceView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct JobSpaceView: View {
    @State private var isShowExperience = false
    
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                toggleView
                Text("다양한 감정을 초등학생에게\n아름답게 전달하는 사람")
                    .description()
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                CustomTabView()
            }
            ZStack {
                ValueOrbit
                CenterCircle
            }
        }
    }
}
extension JobSpaceView {
    var ValueOrbit: some View {
        Ellipse()
            .stroke(LinearGradient(
                gradient: Gradient(colors: [
                    Color.purple,
                    Color.white,
                    Color.purple
                    
                ]),
                startPoint: .leading,
                endPoint: .trailing
            ),
            lineWidth: 2)
            .frame(width: 850,height: 660)
            .rotationEffect(Angle(degrees: -40))
            .offset(x: -310, y: 150)
    }
    var CenterCircle: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.2))
            Circle()
                .stroke(LinearGradient(
                    gradient: Gradient(colors: [
                        Color.purple,
                        Color.white,
                        Color.purple
                        
                    ]),
                    startPoint: .leading,
                    endPoint: .trailing
                ),
                lineWidth: 2)
            HStack {
                Spacer()
                Text("나의\n가치")
                    .description(.white, 30)
                    .multilineTextAlignment(.center)
            }
            .padding(50)
        }
        .frame(width: 260, height: 260)
        .offset(x: -200, y: 90)
        
    }
    var toggleView: some View {
        HStack {
            Spacer()
            Button {
               
            } label: {
                Image(isShowExperience ? "mission_toggle_on" : "mission_toggle_off")
            }
        }
        .padding()
    }
}

struct JobSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        JobSpaceView()
    }
}
