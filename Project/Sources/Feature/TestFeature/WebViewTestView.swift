//
//  WebViewTestView.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

struct WebViewTestView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: MyWebView(urlToLoad: "https://google.com")) {
                Text("Dotori")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(20, antialiased: true)
                    .ignoresSafeArea()

                Text("테스트")
                    .foregroundStyle(AppColor.dark)
                    .oeCook(.medium, size: 10)
            }
        }
    }
}

#Preview {
    WebViewTestView()
}
