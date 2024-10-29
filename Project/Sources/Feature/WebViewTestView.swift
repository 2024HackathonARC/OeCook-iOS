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
                    //.edgesIgnoringSafeArea(.all)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.black)
                    .cornerRadius(20, antialiased: true)
                    .ignoresSafeArea()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    WebViewTestView()
}
