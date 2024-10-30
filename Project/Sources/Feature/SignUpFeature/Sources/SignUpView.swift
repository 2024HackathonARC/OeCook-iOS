//
//  SignUpView.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: SignUpViewModel
    @State private var showError: Bool = false
    let languag = ["한국어", "English", "中国人", "日本語", "Русский", "ภาษาไทย", "français"]
    @State private var selectedColor = ""
    @State var language = ""
    @State private var showPicker = false
    @State private var oButton = false
    @State private var xButton = false
    @State private var oButton2 = false
    @State private var xButton2 = false
    @State var allergyStatus = [Bool](repeating: false, count: 8)
    @State private var isActive = false
    @State private var selectedStudent = ""

    var body: some View {
        NavigationStack {
            ScrollView {
            VStack(spacing: 0) {
                Image("oeCookLogo")
                    .padding(.top, 16)

                Text("회원가입")
                    .oeCook(.semibold, size: 24)
                    .padding(.top, 10)

                oeCookTextField(
                    "닉네임을 입력해주세요.",
                    text: $viewModel.nameTextField,
                    title: "닉네임"
                )

                oeCookTextField(
                    "아이디을 입력해주세요.",
                    text: $viewModel.idTextField,
                    title: "아이디"
                )
                .padding(.top, 20)

                oeCookTextField(
                    "(8~24자 영어(대소문자)/숫자 특수문자 1개이상)",
                    text: $viewModel.passwordTextField,
                    title: "비밀번호"
                )
                .padding(.top, 20)

                oeCookTextField(
                    "비밀번호를 다시 입력해주세요.",
                    text: $viewModel.passwordCheckTextField,
                    errorText: "비밀번호를 잘못 입력했습니다.",
                    isError: showError,
                    onSubmit: {
                        if viewModel.passwordCheckTextField.isEmpty {
                            showError = true
                        } else {
                            showError = false
                        }
                    }
                )
                .padding(.top, 3)

                ZStack {
                    oeCookTextField(
                        "언어를 선택해주세요.",
                        text: $language,
                        title: "언어",
                        errorText: "언어를 선택해주세요.",
                        isError: showError,
                        isDisabled: true,
                        onSubmit: {
                            if viewModel.languageTextField.isEmpty {
                                showError = true
                            } else {
                                showError = false
                            }
                        }
                    )
                    .padding(.top, 20)

                    Image("downButton")
                        .padding(.top, 50)
                        .padding(.leading, 310)
                        .onTapGesture {
                            showPicker.toggle()
                        }
                }

                Text("알레르기를 선택해주세요.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .oeCook(.semibold, size: 16)
                    .padding(.leading, 16)
                    .padding(.top, 20)

                HStack(spacing: 20) {
                    allergy(text: "육류", isSelected: $allergyStatus[0])
                    allergy(text: "견과류", isSelected: $allergyStatus[1])
                    allergy(text: "유제품", isSelected: $allergyStatus[2])
                }
                .padding(.top, 10)

                HStack(spacing: 20) {
                    allergy(text: "혜산물", isSelected: $allergyStatus[3])
                    allergy(text: "계란", isSelected: $allergyStatus[4])
                    allergy(text: "밀가루", isSelected: $allergyStatus[5])
                }
                .padding(.top, 10)

                HStack(spacing: 20) {
                    allergy(text: "과일", isSelected: $allergyStatus[6])
                    allergy(text: "기타", isSelected: $allergyStatus[7])
                }
                .padding(.top, 10)


                Text("비건이신가요?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .oeCook(.semibold, size: 16)
                    .padding(.leading, 16)
                    .padding(.top, 20)

                HStack(spacing: 0) {
                    Image(oButton ? "trueO" : "falseO")
                        .padding(.leading, 30)
                        .onTapGesture {
                            oButton.toggle()
                            xButton = false
                        }
                    Spacer()
                    Image(xButton ? "trueX" : "falseX")
                        .padding(.trailing, 30)
                        .onTapGesture {
                            oButton = false
                            xButton.toggle()
                        }
                }
                .padding(.top, 10)

                Text("할랄 인증이 필요하신가요?")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .oeCook(.semibold, size: 16)
                    .padding(.leading, 16)
                    .padding(.top, 20)

                HStack(spacing: 0) {
                    Image(oButton2 ? "trueO" : "falseO")
                        .padding(.leading, 30)
                        .onTapGesture {
                            oButton2.toggle()
                            xButton2 = false
                        }
                    Spacer()
                    Image(xButton2 ? "trueX" : "falseX")
                        .padding(.trailing, 30)
                        .onTapGesture {
                            oButton2 = false
                            xButton2.toggle()
                        }
                }
                .padding(.top, 10)

                oeCookButton(
                    text: "확인",
                    horizontalPadding: 165,
                    verticalPadding: 14
                ){
                    self.isActive.toggle()
                }
                .navigationDestination(isPresented: $isActive) {
                    SignInView(viewModel: SignInViewModel())
                }
                .padding(.top, 30)

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image("leftBackButton")
                            .padding(.top, 10)
                    }
                }
            }
            .sheet(isPresented: $showPicker) {
                VStack {
                    Picker("원하는 색을 골라주세요", selection: $selectedColor) {
                        ForEach(languag, id: \.self) { languags in
                            Text(languags)
                                .tag(languags)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())  // 휠 스타일의 Picker 사용

                    Button("선택") {
                        language = selectedColor
                        showPicker = false
                    }
                    .padding()
                }
                .presentationDetents([.height(180)])  // sheet의 높이를 조절
            }
        }
        }
    }
}

@ViewBuilder
func allergy(
    text: String,
    isSelected: Binding<Bool>
) -> some View {
    RoundedRectangle(cornerRadius: 6)
        .foregroundStyle(isSelected.wrappedValue ? .gray300 : .gray100)
        .frame(width: 110, height: 35)
        .overlay(
            Text(text)
                .oeCook(.medium, size: 12)
        )

        .onTapGesture {
            isSelected.wrappedValue.toggle()
        }
}

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
