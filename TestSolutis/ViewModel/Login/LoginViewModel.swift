//
//  LoginViewModel.swift
//  TestSolutis
//
//  Created by Gabriel de Castro Chaves on 25/02/23.
//

import Foundation
import CPF_CNPJ_Validator

final class LoginViewModel {
    func isValid(user: String, password: String) -> Bool {
        if isValid(user: user) && isValid(password: password) {
            return true
        }
        return false
    }
    
    fileprivate func isValid(user: String) -> Bool {
        if isValid(cpf: user) || isValid(email: user) {
            return true
        }
        return false
    }
    
    fileprivate func isValid(password: String) -> Bool {
        let passowrdRule = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{6,}$")
        let isValid = passowrdRule.evaluate(with: password)
        return isValid
    }
    
    fileprivate func isValid(email: String) -> Bool {
        guard let atIndex = email.firstIndex(of: "@") else {
            return false
        }
        let emailHasDot = email.contains(".")
        let emailHasAt = email.contains("@")
        let emailIsHigherOrEqualToFive = email.count >= 5
        let substring = email[atIndex...]
        let substringHasDot = substring.contains(".")
        if  emailHasDot &&
                emailHasAt &&
                emailIsHigherOrEqualToFive &&
                substringHasDot {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func isValid(cpf: String?) -> Bool {
        guard let cpf = cpf,
              BooleanValidator().validate(cpf: cpf) else { return false }
        return true
    }
}
