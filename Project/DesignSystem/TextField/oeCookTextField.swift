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
    var isDisabled: Bool
    var isSecure: Bool
    var onSubmit: () -> Void

    private var borderColor: Color {
        if isError {
            return .red
        } else {
            return .gray100
        }
    }

    public init(
        _ placeholder: String = "",
        text: Binding<String>,
        title: String = "",
        errorText: String = "",
        isError: Bool = false,
        isDisabled: Bool = false,
        isSecure: Bool = false,
        onSubmit: @escaping () -> Void = {}
    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
        self.errorText = errorText
        self.isError = isError
        self.isDisabled = isDisabled
        self.isSecure = isSecure
        self.onSubmit = onSubmit
    }

    @State private var eyesState: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !title.isEmpty {
                Text(title)
                    .oeCook(.semibold, size: 16)
                    .oeCookColor(.black)
            }
            ZStack {
                TextField(placeholder, text: $text)
                    .padding(.horizontal, 16)
                    .frame(height: 44)
                    .onSubmit(onSubmit)
                    .focused($isFocused)
                //.expoColor(ExpoColor.black)
                    .disabled(isDisabled)
                    .oeCook(.regular, size: 14)
                    .textContentType(isSecure ? .password : .none)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(borderColor)
                    }
                    .cornerRadius(8)
                    .onTapGesture {
                        if !isDisabled { isFocused = true }
                    }
                    .padding(.top, 7)
                if isSecure {
                    Image(systemName: eyesState ? "eyes" : "eyes.inverse")
                        .padding(.leading, 310)
                        .padding(.top, 3)
                }
            }

            if isError {
                Text(errorText)
                    .oeCookColor(Color.red)
                    .oeCook(.regular, size: 12)
                    .padding(.top, 3)
            }
        }
        .padding(.horizontal, 16)
    }
}

