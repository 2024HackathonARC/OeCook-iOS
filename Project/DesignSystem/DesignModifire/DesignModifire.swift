//
//  DesignModifire.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

enum FontWeight: String {
    case light = "Pretendard-Light"
    case regular = "Pretendard-Regular"
    case medium = "Pretendard-Medium"
    case semibold = "Pretendard-SemiBold"
    case bold = "Pretendard-Bold"
    case black = "Pretendard-Black"
    case thin = "Pretendard-Thin"
}

struct PretendardFontModifier: ViewModifier {
    var weight: FontWeight
    var size: CGFloat

    func body(content: Content) -> some View {
        content.font(.custom(weight.rawValue, size: size))
    }
}

extension View {
    func onCook(_ weight: FontWeight, size: CGFloat) -> some View {
        self.modifier(PretendardFontModifier(weight: weight, size: size))
    }
}
