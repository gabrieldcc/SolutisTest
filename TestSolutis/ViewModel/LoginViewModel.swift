//
//  LoginViewModel.swift
//  TestSolutis
//
//  Created by Gabriel de Castro Chaves on 25/02/23.
//

import Foundation
import CPF_CNPJ_Validator

final class LoginViewModel {
    
    func isValidUser(login: String) -> Bool {
        if validateCPF(cpf: login) ||
            validateEmail(login: login) {
            return true
        }
        return false
    }
    
    fileprivate func validateEmail(login: String) -> Bool {
        guard let atIndex = login.firstIndex(of: "@") else {
            return false
        }
        let emailHasDot = login.contains(".")
        let emailHasAt = login.contains("@")
        let emailIsHigherOrEqualToFive = login.count >= 5
        let substring = login[atIndex...]
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
    
    fileprivate func validateCPF(cpf: String?) -> Bool {
       guard let cpf = cpf,
               BooleanValidator().validate(cpf: cpf) else { return false }
       return true
   }
}
