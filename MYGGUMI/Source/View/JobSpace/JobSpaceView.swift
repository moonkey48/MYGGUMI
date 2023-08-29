//
//  JobSpaceView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct JobSpaceView: View {
    @State private var sinusA = sin(90.0 * Double.pi / 180)
    @State private var cosinusA = cos(90 * Double.pi / 180)
    @State private var sinusB = sin(90.0 * Double.pi / 180)
    @State private var cosinusB = cos(90 * Double.pi / 180)
    @State private var sinusC = sin(90.0 * Double.pi / 180)
    @State private var cosinusC = cos(90 * Double.pi / 180)
    @State private var sinusD = sin(90.0 * Double.pi / 180)
    @State private var cosinusD = cos(90 * Double.pi / 180)
    
    @State private var scaleA: CGFloat = 1.0
    @State private var scaleB: CGFloat = 1.0
    @State private var scaleC: CGFloat = 1.0
    @State private var scaleD: CGFloat = 1.0
    
    @State private var time: CGFloat = 210
    
    let circleWidth: CGFloat = 850
    let circleHeight: CGFloat = 660
    let timeGapB: CGFloat = 30
    let timeGapC: CGFloat = 60
    let timeGapD: CGFloat = 90
    @State private var isShowExperience = false
    
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: geo.size.width)
                toggleView
                    .frame(width: geo.size.width)
                ZStack {
                    Rectangle()
                        .fill(.white.opacity(0.3))
                        .frame(width: 220, height: 50)
                        .blur(radius: 20)

                    Text("다양한 감정을 초등학생에게\n아름답게 전달하는 사람")
                        .description()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                CustomTabView()
            }
            ZStack {
                ValueOrbit
                CenterCircle
                
                ZStack {
                    CircleOnOrbit(text: "소속감", scale: $scaleA)
                        .offset(x:sinusA * circleWidth / 2, y: cosinusA * circleHeight / 2)
                        .rotationEffect(Angle(degrees: -40))
    
                    CircleOnOrbit(text: "자기계발", scale: $scaleB)
                        .offset(x:sinusB * circleWidth / 2, y: cosinusB * circleHeight / 2)
                        .rotationEffect(Angle(degrees: -40))
                    CircleOnOrbit(text: "도전성", scale: $scaleC)
                        .offset(x:sinusC * circleWidth / 2, y: cosinusC * circleHeight / 2)
                        .rotationEffect(Angle(degrees: -40))
                    CircleOnOrbit(text: "즐거움", scale: $scaleD)
                        .offset(x:sinusD * circleWidth / 2, y: cosinusD * circleHeight / 2)
                        .rotationEffect(Angle(degrees: -40))
                }
                .offset(x: -310, y: 150)
                    
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                time += 0.5
                sinusA = -sin(time * Double.pi / 180)
                cosinusA = cos(time * Double.pi / 180)
                let gapTimeB = time + timeGapB
                sinusB = -sin(gapTimeB * Double.pi / 180)
                cosinusB = cos(gapTimeB * Double.pi / 180)
                let gapTimeC = time + timeGapC
                sinusC = -sin(gapTimeC * Double.pi / 180)
                cosinusC = cos(gapTimeC * Double.pi / 180)
                let gapTimeD = time + timeGapD
                sinusD = -sin(gapTimeD * Double.pi / 180)
                cosinusD = cos(gapTimeD * Double.pi / 180)
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
struct CircleOnOrbit: View {
    @State var text = "default"
    @Binding var scale: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.white, lineWidth: 2)
            Circle()
                .fill(.white.opacity(0.2))
            Text(text)
                .description()
                .rotationEffect(Angle(degrees: 40))
        }
        .frame(width: 100 * scale, height: 100 * scale)
    }
}

struct JobSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        JobSpaceView()
    }
}
