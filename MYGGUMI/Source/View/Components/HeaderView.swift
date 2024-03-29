//
//  HeaderView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var basicDataObservable = BasicDataObservable.shared
    var body: some View {
        HStack(spacing: 0) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image("chevron_left")
                    .padding(.leading, 10)
            }
            Spacer()
            Image("main_coin")
                .padding(.trailing, 10)
            Text("\(basicDataObservable.coin)")
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
