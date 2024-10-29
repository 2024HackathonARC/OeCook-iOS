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
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onCook(.medium, size: 30)
                .padding()

            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .onCook(.semibold, size: 30)
        }
    }
}

#Preview {
    DesignTestView()
}
