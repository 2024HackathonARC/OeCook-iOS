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
    @State private var eyesState: Bool
    @Binding var isSecure: Bool
    var onSubmit: () -> Void
    @State private var eyesState2: Bool

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
        eyesState: Bool = false,
        isDisabled: Bool = false,
        isSecure: Binding<Bool>? = nil,
        onSubmit: @escaping () -> Void = {}

    ) {
        self._text = text
        self.placeholder = placeholder
        self.title = title
        self.errorText = errorText
        self.isError = isError
        self.eyesState = eyesState
        self.isDisabled = isDisabled
        self._isSecure = isSecure ?? .constant(false)
        self.onSubmit = onSubmit
        self._eyesState2 = State(initialValue: isSecure?.wrappedValue ?? false)
    }

    //@State private var eyesState: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if !title.isEmpty {
                Text(title)
                    .oeCook(.semibold, size: 16)
                    .oeCookColor(.black)
            }
            ZStack {
                            if isSecure {
                                SecureField(placeholder, text: $text)
                                    .padding(.horizontal, 16)
                                    .frame(height: 44)
                                    .onSubmit(onSubmit)
                                    .focused($isFocused)
                                    .disabled(isDisabled)
                                    .oeCook(.regular, size: 14)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .strokeBorder(borderColor)
                                    }
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        if !isDisabled { isFocused = true }
                                    }
                                    .padding(.top, 7)
                            } else {
                                TextField(placeholder, text: $text)
                                    .padding(.horizontal, 16)
                                    .frame(height: 44)
                                    .onSubmit(onSubmit)
                                    .focused($isFocused)
                                    .disabled(isDisabled)
                                    .oeCook(.regular, size: 14)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .strokeBorder(borderColor)
                                    }
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        if !isDisabled { isFocused = true }
                                    }
                                    .padding(.top, 7)
                            }

                if eyesState {
                    Image(systemName: eyesState2 ? "eye.slash" : "eye")
                        .padding(.leading, 310)
                        .padding(.top, 3)
                        .onTapGesture {
                            eyesState2.toggle()
                        }
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

