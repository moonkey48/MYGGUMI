//
//  ComplimentMainView.swift
//  MYGGUMI
//
//  Created by Seungui Moon on 2023/08/23.
//

import SwiftUI

struct ComplimentMainView: View {
    var body: some View {
        BackgroundView { geo in
            VStack(spacing: 0) {
                HeaderView()
                Spacer()
                VStack(spacing: 20){
                    NavigationLink {
                        ComplimentFriendView()
                    } label: {
                        RectangleView(width: 266, height: 120, text: "친구 칭찬")
                    }
                    NavigationLink {
                        ComplimentSelfView()
                    } label: {
                        RectangleView(width: 266, height: 120, text: "셀프 칭찬")
                    }
                }
                Spacer()
                CustomTabView()
            }
        }
    }
}

struct ComplimentMainView_Previews: PreviewProvider {
    static var previews: some View {
        ComplimentMainView()
    }
}
