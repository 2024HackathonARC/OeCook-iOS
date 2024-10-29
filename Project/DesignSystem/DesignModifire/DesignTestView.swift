//
//  DesignTestView.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

struct DesignTestView: View {
    var body: some View {
        VStack {

            Text("안녕하세요!")
                .oeCook(.semibold, size: 30)

            Text("안녕하세요!")
                .oeCook(.bold, size: 30)

            Text("안녕하세요!")
                .oeCook(.thin, size: 30)
        }
    }
}

#Preview {
    DesignTestView()
}
