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

struct AppColor {
    static let gray100 = Color("gray100")
    static let gray200 = Color("gray200")
    static let gray300 = Color("gray300")
    static let gray400 = Color("gray400")
    static let gray500 = Color("gray500")
    static let gray600 = Color("gray600")
    static let gray700 = Color("gray700")
    static let gray800 = Color("gray800")
    static let gray900 = Color("gray900")
    static let lightAction = Color("Light-action")
    static let lightHover = Color("Light-hover")
    static let light = Color("Light")
    static let normal = Color("Normal")
    static let normalAction = Color("Normal-action")
    static let normalHover = Color("Normal-hover")
    static let darkAction = Color("Dark-action")
    static let darkHover = Color("Dark-hover")
    static let dark = Color("Dark")
    static let darker = Color("Darker")

}


struct PretendardColorModifier: ViewModifier {
    var color: Color

    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
    }
}



extension View {
    func oeCook(_ weight: FontWeight, size: CGFloat) -> some View {
        self.modifier(PretendardFontModifier(weight: weight, size: size))
    }

    func oeCookColor(_ color: Color) -> some View {
            self.modifier(PretendardColorModifier(color: color))
    }
}
