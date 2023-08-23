//
//  HeaderView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 0) {
            Spacer()
            Image("main_coin")
                .padding(.trailing, 10)
            Text("0")
                .description()
        }
        .padding([.bottom, .horizontal], 20)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
