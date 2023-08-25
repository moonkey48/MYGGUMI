//
//  RecordWithAIView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/24.
//

import SwiftUI

struct RecordWithAIView: View {
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

struct RecordWithAIView_Previews: PreviewProvider {
    static var previews: some View {
        RecordWithAIView()
    }
}
