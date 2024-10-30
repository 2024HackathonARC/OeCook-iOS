//
//  MyWebView.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }

        let webView = WKWebView()

        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {

    }
}

struct MyWebViewContainer: View {
    var urlToLoad: String

    var body: some View {
        MyWebView(urlToLoad: urlToLoad)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    MyWebViewContainer(urlToLoad: "https://www.google.com")
}
