//
//  JobSpaceView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/25.
//

import SwiftUI

struct JobSpaceView: View {
    var body: some View {
        BackgroundView {
            VStack {
                HeaderView()
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct JobSpaceView_Previews: PreviewProvider {
    static var previews: some View {
        JobSpaceView()
    }
}
