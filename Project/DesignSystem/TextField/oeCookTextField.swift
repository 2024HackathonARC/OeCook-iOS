//
//  oeCookTextField.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

struct oeCookTextField: View {
    @Binding var text: String
    @FocusState var isFocused: Bool
    var title: String
    var placeholder: String
    var errorText: String
    var isError: Bool
    var onSubmit: () -> Void

    private var borderColor: Color {
        if isError {
            return .red
        } else {
            return .gray
        }
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        title: String = "",
        errorText: String = "",
        isError: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
        self.errorText = errorText
        self.isError = isError
        self.onSubmit = onSubmit
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !title.isEmpty {
                Text(title)
                    //.expoFont(.body2B)
                    //.expoColor(ExpoColor.black)
            }

            TextField(placeholder, text: $text)
                .padding(.horizontal, 16)
                .frame(height: 44)
                .onSubmit(onSubmit)
                .focused($isFocused)
                //.expoColor(ExpoColor.black)
                //.expoFont(.caption1R)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(borderColor)
                }
                .cornerRadius(8)
                .onTapGesture {
                    isFocused = true
                }

            if isError {
                Text(errorText)
                    //.expoColor(ExpoColor.error)
                    //.expoFont(.caption2R)
            }
        }
        .padding(.horizontal, 16)
    }
}

