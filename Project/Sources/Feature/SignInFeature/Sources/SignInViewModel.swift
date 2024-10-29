//
//  SignInViewModel.swift
//  oeCook
//
//  Created by 서지완 on 10/30/24.
//

import Foundation

final class SignInViewModel: ObservableObject {
    @Published var nameTextField: String = ""
    @Published var idTextField: String = ""
    @Published var emailTextField: String = ""
    @Published var passwordTextField: String = ""
}
