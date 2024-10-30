//
//  TabBarView.swift
//  oeCook
//
//  Created by 서지완 on 10/30/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 1

    var body: some View {
        TabView(selection: $selectedTab) {
            MyWebView(urlToLoad: "https://oecook.netlify.app/")
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(selectedTab == 1 ? "onHouse" : "offHouse")
                    Text("메인")
                }
                .tag(1)

            MyWebView(urlToLoad: "https://oecook.netlify.app/brand")
                .navigationBarBackButtonHidden(true)
                .tabItem {
                    Image(selectedTab == 2 ? "onOffice" : "offOffice")
                    Text("기업")
                }
                .tag(2)

            RecipeView(viewModel: RecipeViewModel(), selectedTab: $selectedTab)
                .tabItem {
                    Image(selectedTab == 3 ? "onBook" : "offBook")
                    Text("레시피")
                }
                .tag(3)
        }
        .accentColor(.red)
    }
}

#Preview {
    TabBarView()
}
