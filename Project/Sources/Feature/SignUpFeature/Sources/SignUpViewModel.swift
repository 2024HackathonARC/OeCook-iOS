//
//  SignUpViewModel.swift
//  oeCook
//
//  Created by 서지완 on 10/29/24.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    @Published var nameTextField: String = ""
    @Published var idTextField: String = ""
    @Published var emailTextField: String = ""
    @Published var passwordTextField: String = ""
    @Published var languageTextField: String = ""
    @Published var passwordCheckTextField: String = ""
    @Published var uploadImage: Int = 9
    @Published var reactionImage: Int = 5
    @Published var isShowingBottomSheet = false
}
