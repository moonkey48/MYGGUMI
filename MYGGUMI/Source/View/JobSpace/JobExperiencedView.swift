//
//  JobExperiencedView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/27.
//

import SwiftUI

struct JobExperiencedView: View {
    @State private var sinusA = sin(90.0 * Double.pi / 180)
    @State private var cosinusA = cos(90 * Double.pi / 180)
    @State private var sinusB = sin(90.0 * Double.pi / 180)
    @State private var cosinusB = cos(90 * Double.pi / 180)
    @State private var sinusC = sin(90.0 * Double.pi / 180)
    @State private var cosinusC = cos(90 * Double.pi / 180)
    
    @State private var time: CGFloat = 90
    
    let circleWidth: CGFloat = 350
    let circleHeight: CGFloat = 250
    let timeGapB: CGFloat = 180
    let timeGapC: CGFloat = 240
    
    var body: some View {
        BackgroundView { geo in
            VStack {
                HeaderView()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.horizontal, 20)
                Spacer()
                CustomTabView()
            }
            .description()
            ZStack  {
                EllipseView
                EllipseJobElement(text: "시각\n디자이너")
                    .offset(x:sinusA * circleWidth / 2, y: cosinusA * circleHeight / 2)
                    .rotationEffect(Angle(degrees: -30))
                EllipseJobElement(text: "디지털\n마케터")
                    .offset(x:sinusB * circleWidth / 2, y: cosinusB * circleHeight / 2)
                    .rotationEffect(Angle(degrees: -30))
                EllipseJobElement(text: "작사가")
                    .offset(x:sinusA * circleWidth, y: cosinusA * circleHeight)
                    .rotationEffect(Angle(degrees: -30))
                EllipseJobElement(text: "동화책\n디자이너")
                    .offset(x:sinusC * circleWidth, y: cosinusC * circleHeight)
                    .rotationEffect(Angle(degrees: -30))
                VStack {
                    Image("profile_noStroke")
                    ZStack {
                        Rectangle()
                            .fill(.white.opacity(0.3))
                            .blur(radius: 20)
                            .frame(width: 160, height: 40)
                        Text("다양한 감정을 초등학생에게\n아름답게 전달하는 사람")
                            .description(.white, 14)
                            .multilineTextAlignment(.center)
                    }
                }
                
            }
            .description()
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
                time += 1
                sinusA = sin(time * Double.pi / 180)
                cosinusA = cos(time * Double.pi / 180)
                let gapTimeB = time + timeGapB
                sinusB = sin(gapTimeB * Double.pi / 180)
                cosinusB = cos(gapTimeB * Double.pi / 180)
                let gapTimeC = time + timeGapC
                sinusC = sin(gapTimeC * Double.pi / 180)
                cosinusC = cos(gapTimeC * Double.pi / 180)
            }
        }
    }
}

extension JobExperiencedView {
    var EllipseView: some View {
        ZStack {
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
                .frame(width: circleWidth,height: circleHeight)
                .rotationEffect(Angle(degrees: -30))
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
                .frame(width: circleWidth * 1.4,height: circleHeight * 1.4)
                .rotationEffect(Angle(degrees: -30))
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
                .frame(width: circleWidth * 2,height: circleHeight * 2)
                .rotationEffect(Angle(degrees: -30))
        }
        .blur(radius: 1)
    }
}
struct EllipseJobElement: View {
    @State var text = "default"
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.2))
                .frame(width: 80, height: 80)
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
                .frame(width: 80, height: 80)
            Text(text)
                .description(.white, 15)
                .multilineTextAlignment(.center)
                .rotationEffect(Angle(degrees: 30))
        }
        .frame(width: 80, height: 80)
    }
}

struct JobExperiencedView_Previews: PreviewProvider {
    static var previews: some View {
        JobExperiencedView()
    }
}
