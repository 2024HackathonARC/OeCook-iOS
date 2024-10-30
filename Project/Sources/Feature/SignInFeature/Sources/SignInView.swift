//
//  SignInView.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: SignInViewModel
    @State private var showError: Bool = false
    @State private var isActiveSignup = false
    @State private var isActiveSignin = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                Image("oeCookLogo")
                    .padding(.top, 104)

                Text("로그인")
                    .oeCook(.semibold, size: 24)
                    .padding(.top, 10)

                oeCookTextField(
                    "아이디를 입력해주세요.",
                    text: $viewModel.idTextField,
                    title: "아이디"
                )
                .padding(.top, 20)

                oeCookTextField(
                    "비밀번호를 입력해주세요.",
                    text: $viewModel.passwordTextField,
                    title: "비밀번호",
                    errorText: "비밀번호를 잘못 입력했습니다.",
                    isError: showError,
                    onSubmit: {
                        if viewModel.passwordTextField.isEmpty {
                            showError = true
                        } else {
                            showError = false
                        }
                    }
                )
                .padding(.top, 20)

                HStack(spacing: 0) {
                    Text("아직 로그인을 안 하셨나요?")
                        .oeCook(.regular, size: 12)
                        .foregroundStyle(.gray300)

                    Text("ㅣ")
                        .padding(.horizontal, 5)
                        .oeCook(.regular, size: 12)
                        .oeCookColor(.gray500)

                    Text("회원가입")
                        .oeCook(.regular, size: 12)
                        .oeCookColor(.gray500)
                        .navigationDestination(isPresented: $isActiveSignup) {
                            SignUpView(viewModel: SignUpViewModel())
                        }
                        .onTapGesture {
                            self.isActiveSignup.toggle()
                        }
                }
                .padding(.top, 24)

                oeCookButton(
                    text: "로그인",
                    horizontalPadding: 160,
                    verticalPadding: 14
                ){
                    self.isActiveSignin.toggle()
                }
                .navigationDestination(isPresented: $isActiveSignin) {
                    WebViewTestView()
                }
                .padding(.top, 152)


                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
