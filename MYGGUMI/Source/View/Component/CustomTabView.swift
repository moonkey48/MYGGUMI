//
//  CustomTabView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct CustomTabView: View {
    var body: some View {
        HStack(spacing: -10) {
            Image("icon_tab1")
            Image("icon_tab2")
            Image("icon_tab3")
            Image("icon_tab4")
            Image("icon_tab5")
        }
    }
}
struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
